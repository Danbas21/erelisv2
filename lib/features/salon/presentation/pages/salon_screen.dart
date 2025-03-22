// lib/features/salon/presentation/pages/salon_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/features/salon/presentation/bloc/salon_bloc.dart';
import 'package:erelis/features/salon/presentation/widgets/subject_card.dart';
import 'package:erelis/features/salon/presentation/widgets/salon_sidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SalonScreen extends StatefulWidget {
  const SalonScreen({super.key});

  @override
  State<SalonScreen> createState() => _SalonScreenState();
}

class _SalonScreenState extends State<SalonScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger loading of courses when screen initializes
    context.read<SalonBloc>().add(const SalonEvent.loadCourses());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          SalonSidebar(
            isExpanded: true,
            onToggle: () {
              context.read<SalonBloc>().add(const SalonEvent.toggleSidebar());
            },
          ),
          // _buildHeader(),
          Expanded(
            child: _buildMainContent(),
          ),
        ],
      ),
    );
  }
}

Widget _buildMainContent() {
  return BlocBuilder<SalonBloc, SalonState>(
      buildWhen: (previous, current) {
        return previous.runtimeType != current.runtimeType ||
            (current is Loaded &&
                previous is Loaded &&
                current.subject != previous.subject);
      },
      builder: (context, state) => switch (state) {
            LoadInProgress() => const Center(
                child: CircularProgressIndicator(),
              ),
            Loaded(:final subject) => _buildSubjectGrid(context, subject),
            CourseError(:final message) => _buildErrorView(context, message),
            _ => const SizedBox(),
          });
}

Widget _buildErrorView(BuildContext context, String message) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Error: $message',
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () =>
              context.read<SalonBloc>().add(const SalonEvent.loadCourses()),
          child: const Text('Reintentar'),
        ),
      ],
    ),
  );
}

Widget _buildHeader() {
  final user = FirebaseAuth.instance.currentUser;
  final displayName = user?.displayName ?? 'Student';

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          if (user?.photoURL != null)
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
              radius: 20,
            )
          else
            const CircleAvatar(
              backgroundColor: AppColors.primaryLightBlue,
              radius: 20,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayName,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'Student',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
      Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.email_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () {},
          ),
        ],
      ),
    ],
  );
}

Widget _buildSubjectGrid(BuildContext context, List<dynamic> course) {
  if (course.isEmpty) {
    return const Center(child: Text('No hay cursos disponibles'));
  }

  return LayoutBuilder(
    builder: (context, constraints) {
      // Responsive grid based on available width
      int crossAxisCount = 1;
      if (constraints.maxWidth > 1200) {
        crossAxisCount = 4;
      } else if (constraints.maxWidth > 900) {
        crossAxisCount = 3;
      } else if (constraints.maxWidth > 600) {
        crossAxisCount = 2;
      }

      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: course.length,
          itemBuilder: (_, index) => SubjectCard(
                subject: course[index],
                onOpenUnit: () {
                  // Handle opening unit logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Abrir unidad'),
                      backgroundColor: AppColors.primaryLightBlue,
                    ),
                  );
                },
              ));
    },
  );
}
