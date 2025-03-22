import 'package:erelis/presentation/blocs/tablero/tablero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/features/tablero/domain/entities/user_profile_entity.dart';

class RightSidebar extends StatelessWidget {
  const RightSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: AppColors.cardBackground,
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<TableroBloc, TableroState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Loaded) {
            return _buildContent(context, state.userProfile);
          } else if (state is Error) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No profile data available'));
          }
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, UserProfileEntity profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User profile section
        _buildUserProfile(profile),

        const SizedBox(height: 24),

        // Calendar section
        _buildCalendar(),

        const SizedBox(height: 24),

        // Program section
        _buildProgram(context, profile.subjects),
      ],
    );
  }

  Widget _buildUserProfile(UserProfileEntity profile) {
    return Row(
      children: [
        // User avatar
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: profile.photoUrl != null
                ? DecorationImage(
                    image: NetworkImage(profile.photoUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
            color: profile.photoUrl == null ? AppColors.primaryLightBlue : null,
          ),
          child: profile.photoUrl == null
              ? const Icon(
                  Icons.person,
                  color: Colors.white,
                )
              : null,
        ),

        const SizedBox(width: 12),

        // User info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                profile.role,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),

        // Dropdown button
        IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textSecondary,
          ),
          onPressed: () {
            // Dropdown menu
          },
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    // Get current date
    final now = DateTime.now();
    DateFormat('MMMM yyyy').format(now);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Diciembre 2024',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 20,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: () {
                    // Previous month
                  },
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                ),
                IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: () {
                    // Next month
                  },
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Days of week
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCalendarDay('Fri', '3', isSelected: false),
            _buildCalendarDay('Sat', '4', isSelected: false),
            _buildCalendarDay('Sun', '5', isSelected: false),
            _buildCalendarDay('Mon', '6', isSelected: false),
            _buildCalendarDay('Tue', '7', isSelected: true),
            _buildCalendarDay('Wed', '8', isSelected: false),
          ],
        ),
      ],
    );
  }

  Widget _buildCalendarDay(String dayName, String dayNumber,
      {required bool isSelected}) {
    return Column(
      children: [
        Text(
          dayName,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppColors.primaryLightBlue : Colors.transparent,
          ),
          child: Text(
            dayNumber,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgram(BuildContext context, List<SubjectEntity> subjects) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Programa',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            TextButton(
              onPressed: () {
                // View all
              },
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Program list
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];
            return _buildProgramItem(
              context,
              subject,
              index + 1, // Subject number
            );
          },
        ),
      ],
    );
  }

  Widget _buildProgramItem(
      BuildContext context, SubjectEntity subject, int subjectNumber) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Subject number indicator
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cardBackground,
            ),
            child: Text(
              '$subjectNumber',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Subject info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '${subject.completedChapters} of ${subject.chapterCount} chapters',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Time slot
          Text(
            subject.timeSlot,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.primaryLightBlue,
            ),
          ),
        ],
      ),
    );
  }
}
