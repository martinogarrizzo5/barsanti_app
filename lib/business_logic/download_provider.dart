import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TaskInfo {
  TaskInfo({
    this.name,
    this.link,
    this.taskId,
    this.progress = 0,
    this.status = DownloadTaskStatus.undefined,
  });

  final String? name;
  final String? link;

  String? taskId;
  int progress;
  DownloadTaskStatus status;
}

class DownloadProvider with ChangeNotifier {
  final ReceivePort _port = ReceivePort();
  List<TaskInfo>? _tasks;
  List<TaskInfo>? get tasks => _tasks;

  DownloadProvider() {
    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback, step: 1);
    loadTasks();
  }

  void _bindBackgroundIsolate() {
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }

    _port.listen((dynamic data) async {
      final taskId = (data as List<dynamic>)[0] as String;
      final status = DownloadTaskStatus(data[1] as int);
      final progress = data[2] as int;

      if (_tasks != null && _tasks!.isNotEmpty) {
        final taskIndex = _tasks!.indexWhere((task) => task.taskId == taskId);
        if (taskIndex != -1) {
          _tasks![taskIndex]
            ..status = status
            ..progress = progress;

          if (status == DownloadTaskStatus.complete && progress == 100) {
            openDownloadedFile(_tasks![taskIndex]);
          }
          notifyListeners();
        }
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final port = IsolateNameServer.lookupPortByName('downloader_send_port');
    port?.send([id, status.value, progress]);
  }

  Future<void> loadTasks() async {
    _tasks = [];

    final tasks = await FlutterDownloader.loadTasks();
    if (tasks != null) {
      for (var task in tasks) {
        _tasks!.add(TaskInfo(
          name: task.filename,
          link: task.url,
          taskId: task.taskId,
          progress: task.progress,
          status: task.status,
        ));
      }
    }

    notifyListeners();
  }

  Future downloadFile(String fileName, String fileUrl, {TaskInfo? task}) async {
    final storageDir = await prepareSaveDir();
    if (storageDir == null) return;

    final canDownload = await checkPermission();
    if (!canDownload) return;

    // ios doesn't want urls with spaces
    final encodedUrl = Uri.encodeFull(fileUrl).toString();

    final taskId = await FlutterDownloader.enqueue(
      url: task?.link != null ? task!.link! : encodedUrl,
      savedDir: storageDir,
      showNotification: true,
      openFileFromNotification: true,
      allowCellular: true,
    );

    if (task != null) {
      task.taskId = taskId;
    } else if (_tasks != null) {
      _tasks!.add(TaskInfo(
        name: fileName,
        link: fileUrl,
        taskId: taskId,
      ));
    }

    notifyListeners();
  }

  Future<List<DownloadTask>> getDownloadingTasks() async {
    final tasks = await FlutterDownloader.loadTasksWithRawQuery(
      query: 'SELECT * FROM task WHERE status=3',
    );

    return tasks ?? [];
  }

  Future<List<DownloadTask>> getDownloadedTasks(
      {List<String>? fileUrls}) async {
    String urlCondition = "";

    if (fileUrls != null) {
      urlCondition = "AND url IN (${fileUrls.join(',')})";
    }

    final tasks = await FlutterDownloader.loadTasksWithRawQuery(
      query: 'SELECT * FROM task WHERE status=2 $urlCondition',
    );

    return tasks ?? [];
  }

  Future<List<DownloadTask>> getFailedTasks({List<String>? fileUrls}) async {
    String urlCondition = "";

    if (fileUrls != null) {
      urlCondition = "AND url IN (${fileUrls.join(',')})";
    }

    final tasks = await FlutterDownloader.loadTasksWithRawQuery(
      query: 'SELECT * FROM task WHERE status=4 $urlCondition',
    );

    return tasks ?? [];
  }

  Future<String?> prepareSaveDir() async {
    String? storageDir;

    if (Platform.isAndroid) {
      final androidDir =
          await getExternalStorageDirectories(type: StorageDirectory.downloads);
      storageDir = androidDir?.first.absolute.path;
    } else {
      storageDir = (await getApplicationDocumentsDirectory()).absolute.path;
    }

    if (storageDir == null) {
      debugPrint("Can't get storage directory");
      return null;
    }

    final savedDir = Directory(storageDir);
    if (!await savedDir.exists()) {
      await savedDir.create();
    }

    return storageDir;
  }

  Future<bool> checkPermission() async {
    if (Platform.isIOS) {
      return true;
    }

    if (Platform.isAndroid) {
      final info = await DeviceInfoPlugin().androidInfo;
      if (info.version.sdkInt > 28) {
        return true;
      }

      final status = await Permission.storage.status;
      if (status == PermissionStatus.granted) {
        return true;
      }

      final result = await Permission.storage.request();
      return result == PermissionStatus.granted;
    }

    throw StateError('unknown platform');
  }

  Future<void> pauseDownload(TaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId!);
  }

  Future<void> resumeDownload(TaskInfo task) async {
    final newTaskId = await FlutterDownloader.resume(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<void> retryDownload(TaskInfo task) async {
    final newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<bool> openDownloadedFile(TaskInfo? taskInfo) async {
    final taskId = taskInfo?.taskId;
    if (taskId == null) {
      return false;
    }

    await Future.delayed(const Duration(milliseconds: 100));

    bool canOpen = await FlutterDownloader.open(taskId: taskId);
    if (!canOpen) {
      await delete(taskInfo!);
    }

    return canOpen;
  }

  Future<void> delete(TaskInfo task) async {
    await FlutterDownloader.remove(
      taskId: task.taskId!,
      shouldDeleteContent: true,
    );

    await loadTasks();
    notifyListeners();
  }

  String getDownloadStatusLabel(TaskInfo? task) {
    String label = "";
    if (task == null) return "Scarica";

    if (task.status == DownloadTaskStatus.undefined) {
      label = "Scarica";
    } else if (task.status == DownloadTaskStatus.running) {
      label = "Scaricamento...";
    } else if (task.status == DownloadTaskStatus.enqueued) {
      label = "In coda...";
    } else if (task.status == DownloadTaskStatus.paused) {
      label = "In pausa";
    } else if (task.status == DownloadTaskStatus.complete) {
      label = "Apri";
    } else if (task.status == DownloadTaskStatus.failed) {
      label = "Download fallito";
    } else if (task.status == DownloadTaskStatus.canceled) {
      label = "Download cancellato";
    }

    return label;
  }

  Future<void> handleTaskAction(
      String fileName, String fileUrl, TaskInfo? task) {
    if (task == null) return downloadFile(fileName, fileUrl);

    if (task.status == DownloadTaskStatus.undefined) {
      return downloadFile(fileName, fileUrl, task: task);
    } else if (task.status == DownloadTaskStatus.running) {
      return pauseDownload(task);
    } else if (task.status == DownloadTaskStatus.paused) {
      return resumeDownload(task);
    } else if (task.status == DownloadTaskStatus.complete) {
      return openDownloadedFile(task);
    } else if (task.status == DownloadTaskStatus.failed) {
      return retryDownload(task);
    } else if (task.status == DownloadTaskStatus.canceled) {
      return downloadFile(fileName, fileUrl, task: task);
    }

    return downloadFile(fileName, fileUrl, task: task);
  }
}
