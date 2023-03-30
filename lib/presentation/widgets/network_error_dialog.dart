import 'package:barsanti_app/presentation/widgets/alert_dialog.dart';
import "package:flutter/material.dart";

class NetworkErrorDialog extends StatelessWidget {
  final VoidCallback onRetry;

  const NetworkErrorDialog({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return BarsantiAlertDialog(
      title: "Qualcosa è andato storto",
      description:
          "Si è verificato un errore durante il caricamento dei dati, verifica di avere una connessione a internet e riprova",
      actionTitle: "Riprova",
      onActionPress: onRetry,
    );
  }
}

Future<void> showNetworkErrorDialog(
    BuildContext context, VoidCallback onRetry) async {
  final result = await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (ctx) => NetworkErrorDialog(
      onRetry: () => Navigator.of(ctx).pop(),
    ),
  );

  if (result == null) {
    onRetry();
  }
}
