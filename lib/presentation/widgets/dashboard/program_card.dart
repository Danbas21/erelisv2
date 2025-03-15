import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';
import '../../../domain/entities/course_entity.dart';
import '../responsive/responsive_layout.dart';

class ProgramCard extends StatelessWidget {
  final List<CourseEntity> courses;
  final VoidCallback? onSeeAllPressed;

  const ProgramCard({
    super.key,
    required this.courses,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

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
                  'Programa',
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
            if (courses.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'No hay cursos disponibles',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            else
              ...courses.take(5).map((course) => isMobile
                  ? _buildMobileCourseItem(course, courses.indexOf(course))
                  : _buildDesktopCourseItem(course, courses.indexOf(course))),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopCourseItem(CourseEntity course, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Indicador numérico
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Detalles del curso
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${course.completedChapters} of ${course.totalChapters} chapters',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Horario del curso
          Expanded(
            child: Text(
              '${course.startTime} - ${course.endTime}',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileCourseItem(CourseEntity course, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Indicador numérico
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Detalles del curso
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${course.completedChapters} of ${course.totalChapters} chapters',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Horario del curso
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                course.startTime,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                course.endTime,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
