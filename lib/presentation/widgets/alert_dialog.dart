import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BarsantiAlertDialog extends StatelessWidget {
  final String title;
  final String description;
  final String actionTitle;
  final VoidCallback onActionPress;

  const BarsantiAlertDialog({
    super.key,
    required this.title,
    required this.description,
    required this.actionTitle,
    required this.onActionPress,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: BarsantiStyles.button.copyWith(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                  onPressed: onActionPress,
                  child: Text(actionTitle),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
