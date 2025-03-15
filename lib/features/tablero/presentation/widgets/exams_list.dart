import 'package:erelis/presentation/blocs/tablero/tablero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/features/tablero/domain/entities/exam_entity.dart';

class ExamsList extends StatelessWidget {
  const ExamsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableroBloc, TableroState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Loaded) {
          return _buildContent(context, state.exams);
        } else if (state is Error) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No exam data available'));
        }
      },
    );
  }

  Widget _buildContent(BuildContext context, List<ExamEntity> exams) {
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
            'Examenes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),

          // Exams list
          if (exams.isEmpty)
            Center(
              child: Text(
                'No hay exámenes disponibles',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return _buildExamItem(exam);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildExamItem(ExamEntity exam) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.divider),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  exam.subject,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              _buildStatusBadge(exam.status),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chapter ${exam.chapterNumber}',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                'Page ${exam.pageNumber}',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.help_outline,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                '${exam.questionCount} preguntas',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.timer_outlined,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                exam.time,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Only show "Start" button for pending exams
          if (exam.status == ExamStatus.pending)
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to exam
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryLightBlue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Comenzar'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(ExamStatus status) {
    String text;
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case ExamStatus.pending:
        text = 'Pendiente';
        backgroundColor = AppColors.pendingColor;
        textColor = AppColors.pendingTextColor;
        break;
      case ExamStatus.completed:
        text = 'Completado';
        backgroundColor = AppColors.completedColor;
        textColor = AppColors.completedTextColor;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
