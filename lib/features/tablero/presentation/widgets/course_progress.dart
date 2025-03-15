import 'package:erelis/presentation/blocs/tablero/tablero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/features/tablero/domain/entities/course_progress_entity.dart';

class CourseProgress extends StatelessWidget {
  const CourseProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableroBloc, TableroState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Loaded) {
          return _buildContent(context, state.courseProgress);
        } else if (state is Error) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No progress data available'));
        }
      },
    );
  }

  Widget _buildContent(
      BuildContext context, List<CourseProgressEntity> progressList) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Progreso',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),

          // Progress list
          if (progressList.isEmpty)
            Center(
              child: Text(
                'No hay datos de progreso disponibles',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: progressList.length,
              itemBuilder: (context, index) {
                final progress = progressList[index];
                return _buildProgressItem(context, progress);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildProgressItem(
      BuildContext context, CourseProgressEntity progress) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                progress.chapterName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                'Chapter ${progress.chapterNumber}',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              // Background
              Container(
                width: double.infinity,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              // Progress indicator
              Container(
                width: (MediaQuery.of(context).size.width - 64) *
                    (progress.progressPercentage / 100),
                height: 8,
                decoration: BoxDecoration(
                  gradient: AppTheme.progressGradient,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Update progress button
          if (progress.progressPercentage < 100)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Update progress
                  context.read<TableroBloc>().add(
                        TableroEvent.updateCourseProgress(
                          progressId: progress.id,
                          completed: true,
                        ),
                      );
                },
                child: Text(
                  'Mark as Completed',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryLightBlue,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Assuming this is imported from your theme file
class AppTheme {
  static LinearGradient progressGradient = const LinearGradient(
    colors: [AppColors.primaryLightBlue, AppColors.secondaryTeal],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
