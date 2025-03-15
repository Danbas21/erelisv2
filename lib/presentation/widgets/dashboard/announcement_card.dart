import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool simple;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onButtonPressed,
  }) : simple = false;

  const AnnouncementCard.simple({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onButtonPressed,
  }) : simple = true;

  @override
  Widget build(BuildContext context) {
    if (simple) {
      return _buildSimpleCard();
    }

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
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            _buildAnnouncementContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        _buildAnnouncementContent(),
      ],
    );
  }

  Widget _buildAnnouncementContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryOrange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
