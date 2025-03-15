import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';
import '../../../domain/entities/task_entity.dart';
import '../../../domain/entities/course_entity.dart';
import '../responsive/responsive_layout.dart';

class CourseTaskList extends StatelessWidget {
  final List<TaskEntity> tasks;
  final List<CourseEntity> courses;
  final VoidCallback? onSeeAllPressed;

  const CourseTaskList({
    super.key,
    required this.tasks,
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
            const Text(
              'Asignaturas',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            if (tasks.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'No hay tareas pendientes',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            else
              ...tasks.take(3).map((task) {
                final course = _findCourseForTask(task);
                return isMobile
                    ? _buildMobileTaskItem(task, course)
                    : _buildDesktopTaskItem(task, course);
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopTaskItem(TaskEntity task, CourseEntity? course) {
    if (course == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.divider),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
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
                  'Chapter ${_getChapterNumber(task, course)} Page ${task.page}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Page ${task.page}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              task.dueTime,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: task.isCompleted
                    ? AppColors.completedColor
                    : AppColors.pendingColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                task.isCompleted ? 'Completado' : 'Pendiente',
                style: TextStyle(
                  color: task.isCompleted
                      ? AppColors.completedTextColor
                      : AppColors.pendingTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTaskItem(TaskEntity task, CourseEntity? course) {
    if (course == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.divider),
        borderRadius: BorderRadius.circular(8),
      ),
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
            'Chapter ${_getChapterNumber(task, course)} Page ${task.page}',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.name,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    task.dueTime,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: task.isCompleted
                      ? AppColors.completedColor
                      : AppColors.pendingColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  task.isCompleted ? 'Completado' : 'Pendiente',
                  style: TextStyle(
                    color: task.isCompleted
                        ? AppColors.completedTextColor
                        : AppColors.pendingTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Método auxiliar para encontrar el curso de una tarea
  CourseEntity? _findCourseForTask(TaskEntity task) {
    for (var course in courses) {
      for (var chapter in course.chapters) {
        for (var t in chapter.tasks) {
          if (t.id == task.id) {
            return course;
          }
        }
      }
    }
    return null;
  }

  // Método auxiliar para obtener el número de capítulo de una tarea
  int _getChapterNumber(TaskEntity task, CourseEntity course) {
    for (var chapter in course.chapters) {
      for (var t in chapter.tasks) {
        if (t.id == task.id) {
          return chapter.chapterNumber;
        }
      }
    }
    return 1; // Devolver 1 por defecto si no se encuentra
  }
}
