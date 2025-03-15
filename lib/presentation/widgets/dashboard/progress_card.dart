import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';

import '../../../domain/entities/progress_entity.dart';

class ProgressCard extends StatelessWidget {
  final List<ProgressEntity> progressItems;
  final VoidCallback? onSeeAllPressed;

  const ProgressCard({
    super.key,
    required this.progressItems,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Progreso',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                if (onSeeAllPressed != null)
                  TextButton(
                    onPressed: onSeeAllPressed,
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryLightBlue,
                    ),
                    child: const Text('See all'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (progressItems.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'No hay datos de progreso disponibles',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            else
              ...progressItems
                  .take(4)
                  .map((progress) => _buildProgressItem(progress)),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressItem(ProgressEntity progress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            progress.courseName,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Chapter ${progress.chapterNumber}',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          // Barra de progreso
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress.progressPercentage / 100,
              minHeight: 8,
              backgroundColor: AppColors.background,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primaryLightBlue),
            ),
          ),
        ],
      ),
    );
  }
}
