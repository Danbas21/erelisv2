import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';
import '../../../domain/entities/leaderboard_entity.dart';

class LeaderboardCard extends StatelessWidget {
  final List<LeaderboardEntry> entries;

  const LeaderboardCard({
    super.key,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Leader board',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            if (entries.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'No hay datos disponibles',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            else
              ...entries.take(4).map((entry) =>
                  _buildLeaderboardItem(entry, entries.indexOf(entry))),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardItem(LeaderboardEntry entry, int index) {
    // Colores para los diferentes puestos
    final colors = [
      const Color(0xFFE8FAF0), // 1er lugar - verde claro
      const Color(0xFFFAEEF2), // 2do lugar - rosa claro
      const Color(0xFFEEF2FA), // 3er lugar - azul claro
      const Color(0xFFFFFAEE), // Otros - amarillo claro
    ];

    // Asignar color según posición
    final color = index < colors.length ? colors[index] : colors.last;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Avatar del usuario
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: entry.photoUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(entry.photoUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: entry.photoUrl.isEmpty ? AppColors.primaryLightBlue : null,
            ),
            child: entry.photoUrl.isEmpty
                ? Center(
                    child: Text(
                      entry.name.isNotEmpty
                          ? entry.name.substring(0, 1).toUpperCase()
                          : 'U',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : null,
          ),

          // Nombre del usuario
          Expanded(
            child: Text(
              entry.name,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),

          // Puntaje
          Text(
            'Score ${entry.score}',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
