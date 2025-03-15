import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';
import '../../../domain/entities/event_entity.dart';

class UpcomingEventsCard extends StatelessWidget {
  final List<EventEntity> events;
  final VoidCallback? onSeeAllPressed;

  const UpcomingEventsCard({
    super.key,
    required this.events,
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
                  'Proximos Eventos',
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
            if (events.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'No hay eventos próximos',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            else
              ...events.take(3).map((event) => _buildEventItem(event)),
          ],
        ),
      ),
    );
  }

  Widget _buildEventItem(EventEntity event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Icono del evento
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getEventIcon(event.title),
              color: AppColors.primaryLightBlue,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          // Detalles del evento
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  event.status,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método auxiliar para obtener el icono según el título del evento
  IconData _getEventIcon(String title) {
    final lowerTitle = title.toLowerCase();

    if (lowerTitle.contains('presentación')) {
      return Icons.slideshow;
    } else if (lowerTitle.contains('lecture')) {
      return Icons.school;
    } else if (lowerTitle.contains('english')) {
      return Icons.language;
    } else if (lowerTitle.contains('exam')) {
      return Icons.assignment;
    } else if (lowerTitle.contains('workshop')) {
      return Icons.build;
    } else {
      return Icons.event;
    }
  }
}
