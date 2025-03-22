import 'package:erelis/presentation/blocs/tablero/tablero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/config/app_colors.dart';

class AnnouncementBanner extends StatelessWidget {
  const AnnouncementBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableroBloc, TableroState>(
      builder: (context, state) {
        if (state is Loaded) {}

        //ret Usa pattern matching para Freezed 3 con sealed classes

        return _buildAnnouncementWidget('announcementText');
      },
    );
  }

  Widget _buildAnnouncementWidget(String announcementText) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Announcement',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          Text(
            announcementText,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              // Placeholder for any action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryLightBlue,
            ),
            child: const Text('Únete'),
          ),
        ],
      ),
    );
  }
}
