// lib/features/salon/presentation/widgets/salon_sidebar.dart
import 'package:flutter/material.dart';
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/services/navigation_service.dart';

class SidebarItem {
  final String title;
  final IconData icon;
  final String route;

  SidebarItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}

class SalonSidebar extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const SalonSidebar({
    super.key,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      SidebarItem(
        title: 'Dashboard',
        icon: Icons.dashboard,
        route: '/dashboard',
      ),
      SidebarItem(
        title: 'Calender',
        icon: Icons.calendar_today,
        route: '/calendar',
      ),
      SidebarItem(
        title: 'Library',
        icon: Icons.local_library,
        route: '/library',
      ),
      SidebarItem(
        title: 'Classroom',
        icon: Icons.class_,
        route: '/classroom',
      ),
      SidebarItem(
        title: 'Courses',
        icon: Icons.school,
        route: '/courses',
      ),
      SidebarItem(
        title: 'Integration',
        icon: Icons.integration_instructions,
        route: '/integration',
      ),
      SidebarItem(
        title: 'Assignments',
        icon: Icons.assignment,
        route: '/assignments',
      ),
      SidebarItem(
        title: 'Attendance',
        icon: Icons.people,
        route: '/attendance',
      ),
      SidebarItem(
        title: 'Messages',
        icon: Icons.message,
        route: '/messages',
      ),
      SidebarItem(
        title: 'Help',
        icon: Icons.help,
        route: '/help',
      ),
      SidebarItem(
        title: 'Setting',
        icon: Icons.settings,
        route: '/settings',
      ),
      SidebarItem(
        title: 'Log out',
        icon: Icons.logout,
        route: '/initial',
      ),
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isExpanded ? 250 : 70,
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.7),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: isExpanded
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                if (isExpanded)
                  const Text(
                    'CURSOS ERELIS',
                    style: TextStyle(
                      color: AppColors.primaryLightBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                else
                  Image.asset(
                    'assets/images/logo_small.png',
                    height: 30,
                  ),
                if (isExpanded)
                  IconButton(
                    icon: const Icon(Icons.menu),
                    color: AppColors.textPrimary,
                    onPressed: onToggle,
                  ),
              ],
            ),
          ),
          const Divider(color: AppColors.divider),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: AppColors.primaryLightBlue,
                  ),
                  title: isExpanded
                      ? Text(
                          item.title,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                          ),
                        )
                      : null,
                  onTap: () {
                    if (item.route == '/') {
                      // Handle logout separately
                    } else {
                      NavigationService().navigateTo(item.route);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
