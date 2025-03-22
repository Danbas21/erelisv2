// lib/presentation/widgets/unit_content/completion_actions.dart
import 'package:erelis/config/app_colors.dart';
import 'package:flutter/material.dart';

class CompletionActions extends StatelessWidget {
  final VoidCallback onMarkAsCompleted;
  final VoidCallback onClose;

  const CompletionActions({
    super.key,
    required this.onMarkAsCompleted,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.check_circle),
            label: const Text('Marcar como completada'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.completedTextColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: onMarkAsCompleted,
          ),
          const SizedBox(width: 16),
          OutlinedButton.icon(
            icon: const Icon(Icons.close),
            label: const Text('Cerrar sin completar'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.textSecondary,
              side: BorderSide(color: AppColors.divider),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}
