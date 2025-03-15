import 'package:erelis/presentation/blocs/tablero/tablero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/features/tablero/domain/entities/leader_entity.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableroBloc, TableroState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Loaded) {
          return _buildContent(context, state.leaders);
        } else if (state is Error) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }

  Widget _buildContent(BuildContext context, List<LeaderEntity> leaders) {
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
            'Leader board',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),

          // Leaders list
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: leaders.length,
            itemBuilder: (context, index) {
              final leader = leaders[index];
              return _buildLeaderItem(leader, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderItem(LeaderEntity leader, int index) {
    // Determine background color based on index (position)
    Color itemColor;
    if (index == 0) {
      // First place
      itemColor = AppColors.secondaryYellow.withOpacity(0.1);
    } else if (index == 1) {
      // Second place
      itemColor = Colors.grey[300]!.withOpacity(0.1);
    } else if (index == 2) {
      // Third place
      itemColor = Colors.brown[300]!.withOpacity(0.1);
    } else {
      // Regular positions
      itemColor = Colors.transparent;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: itemColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Avatar/Photo
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(leader.photoUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Name and score
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  leader.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'Score ${leader.score}',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
