import 'package:erelis/presentation/blocs/tablero/tablero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/config/app_colors.dart';

import 'package:erelis/features/tablero/presentation/widgets/announcement_banner.dart';
import 'package:erelis/features/tablero/presentation/widgets/course_progress.dart';
import 'package:erelis/features/tablero/presentation/widgets/exams_list.dart';
import 'package:erelis/features/tablero/presentation/widgets/leader_board.dart';
import 'package:erelis/features/tablero/presentation/widgets/right_sidebar.dart';
import 'package:erelis/features/tablero/presentation/widgets/tablero_sidebar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Disparamos el evento al iniciar la pantalla
    context.read<TableroBloc>().add(const TableroEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // Left Sidebar
          const TableroSidebar(),

          // Main Content
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App Bar Row with Title and Icons
                    _buildAppBar(),

                    const SizedBox(height: 16),

                    // Announcement Banner
                    const AnnouncementBanner(),

                    const SizedBox(height: 16),

                    // Main Dashboard Content (Two Columns)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column (Leader Board and Exams)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              LeaderBoard(),
                              SizedBox(height: 16),
                              ExamsList(),
                            ],
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Right Column (Progress)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CourseProgress(),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right Sidebar (User Profile, Calendar, Program)
          const RightSidebar(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tablero',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.notifications_outlined,
                  color: AppColors.textPrimary),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.email_outlined, color: AppColors.textPrimary),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
