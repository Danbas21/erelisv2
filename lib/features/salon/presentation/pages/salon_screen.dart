// lib/features/salon/presentation/pages/salon_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/features/salon/domain/repositories/subjects_repository.dart';
import 'package:erelis/features/salon/presentation/bloc/salon_bloc.dart';
import 'package:erelis/features/salon/presentation/widgets/subject_card.dart';
import 'package:erelis/features/salon/presentation/widgets/salon_sidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SalonScreen extends StatelessWidget {
  const SalonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SalonBloc(
        subjectsRepository: context.read<SubjectsRepository>(),
      )..add(const SalonEvent.fetchSubjects()),
      child: BlocBuilder<SalonBloc, SalonState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Row(
              children: [
                SalonSidebar(
                  isExpanded: state.isSidebarExpanded,
                  onToggle: () {
                    context
                        .read<SalonBloc>()
                        .add(const SalonEvent.toggleSidebar());
                  },
                ),
                Expanded(
                  child: _buildMainContent(context, state),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainContent(BuildContext context, SalonState state) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          Text(
            'Salon',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.errorMessage != null
                    ? Center(
                        child: Text(
                          state.errorMessage!,
                          style: const TextStyle(
                            color: AppColors.error,
                          ),
                        ),
                      )
                    : _buildSubjectGrid(context, state),
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

  Widget _buildSubjectGrid(BuildContext context, SalonState state) {
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
          itemCount: state.subjects.length,
          itemBuilder: (context, index) {
            final subject = state.subjects[index];
            return SubjectCard(
              subject: subject,
              onOpenUnit: () {
                // Handle opening unit logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Abrir unidad: ${subject.name}'),
                    backgroundColor: AppColors.primaryLightBlue,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
