import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NetworkError extends StatelessWidget {
  final Function onRetry;
  final EdgeInsets padding;
  const NetworkError(
      {super.key,
      required this.onRetry,
      this.padding = const EdgeInsets.symmetric(horizontal: 24)});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            const Text(
              "Si è verificato un errore! ",
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Verifica lo stato della connessione e riprova.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => onRetry(),
              icon: const Icon(Icons.replay_outlined),
              label: const Text("Riprova"),
            ),
          ],
        ),
      ),
    );
  }
}
