import 'package:flutter/material.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../config/app_colors.dart';
import '../../widgets/responsive/responsive_layout.dart';

class DashboardHeader extends StatelessWidget {
  final UserEntity user;
  final bool compact;

  const DashboardHeader({
    super.key,
    required this.user,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Title
          Text(
            'Tablero',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                ),
          ),

          const Spacer(),

          // Search bar (on desktop and tablet)
          if (!ResponsiveLayout.isMobile(context))
            Container(
              width: ResponsiveLayout.isDesktop(context) ? 300 : 200,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'buscar',
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                  prefixIcon:
                      Icon(Icons.search, color: AppColors.textSecondary),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                ),
                style: TextStyle(color: AppColors.textPrimary),
              ),
            ),

          // Notification icon
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: AppColors.textSecondary),
            onPressed: () {},
          ),

          // Messages icon
          IconButton(
            icon: const Icon(Icons.email_outlined,
                color: AppColors.textSecondary),
            onPressed: () {},
          ),

          const SizedBox(width: 8),

          // User profile
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: user.photoUrl.isNotEmpty
                    ? NetworkImage(user.photoUrl)
                    : null,
                backgroundColor:
                    user.photoUrl.isEmpty ? AppColors.primaryLightBlue : null,
                child: user.photoUrl.isEmpty
                    ? Text(
                        user.name.isNotEmpty
                            ? user.name.substring(0, 1).toUpperCase()
                            : 'U',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
              if (!compact) ...[
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      user.role,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down,
                    color: AppColors.textSecondary),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
