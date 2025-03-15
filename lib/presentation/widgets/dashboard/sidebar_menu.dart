import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';

class MenuItem {
  final String route;
  final String title;
  final IconData icon;

  MenuItem({
    required this.route,
    required this.title,
    required this.icon,
  });
}

class SidebarMenu extends StatelessWidget {
  final String logoPath;
  final String currentRoute;
  final bool compact;

  SidebarMenu({
    super.key,
    required this.logoPath,
    required this.currentRoute,
    this.compact = false,
  });

  final List<MenuItem> _menuItems = [
    MenuItem(
      route: 'dashboard',
      title: 'Tablero',
      icon: Icons.dashboard,
    ),
    MenuItem(
      route: 'calendar',
      title: 'Calendario',
      icon: Icons.calendar_today,
    ),
    MenuItem(
      route: 'library',
      title: 'Libreria',
      icon: Icons.book,
    ),
    MenuItem(
      route: 'classroom',
      title: 'Salon',
      icon: Icons.meeting_room,
    ),
    MenuItem(
      route: 'courses',
      title: 'Cursos',
      icon: Icons.school,
    ),
    MenuItem(
      route: 'integrations',
      title: 'Integraciones',
      icon: Icons.integration_instructions,
    ),
    MenuItem(
      route: 'subjects',
      title: 'Asignaturas',
      icon: Icons.subject,
    ),
    MenuItem(
      route: 'attendance',
      title: 'Asistencia',
      icon: Icons.people,
    ),
    MenuItem(
      route: 'settings',
      title: 'Configuración',
      icon: Icons.settings,
    ),
    MenuItem(
      route: 'help',
      title: 'Ayuda',
      icon: Icons.help,
    ),
    MenuItem(
      route: 'messages',
      title: 'Mensajes',
      icon: Icons.message,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: compact ? 70 : 250,
      color: AppColors.cardBackground,
      child: Column(
        children: [
          // Logo section
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Image.asset(
              logoPath,
              height: compact ? 40 : 60,
            ),
          ),

          const Divider(
            color: AppColors.divider,
            height: 1,
          ),

          // Menu items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _menuItems.length,
              itemBuilder: (context, index) {
                final item = _menuItems[index];
                return _buildMenuItem(context, item);
              },
            ),
          ),

          // Logout button
          Container(
            padding: const EdgeInsets.all(16.0),
            child: _buildLogoutButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem item) {
    final bool isSelected = currentRoute == item.route;

    return InkWell(
      onTap: () {
        // Manejar navegación
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 8 : 16,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryDarkBlue : Colors.transparent,
          border: isSelected
              ? const Border(
                  left: BorderSide(
                    color: AppColors.primaryLightBlue,
                    width: 3,
                  ),
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment:
              compact ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Icon(
              item.icon,
              color: isSelected
                  ? AppColors.primaryLightBlue
                  : AppColors.textSecondary,
              size: 22,
            ),
            if (!compact) ...[
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        // Manejar logout
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 8 : 16,
        ),
        child: Row(
          mainAxisAlignment:
              compact ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.logout,
              color: AppColors.textSecondary,
              size: 22,
            ),
            if (!compact) ...[
              const SizedBox(width: 12),
              const Text(
                'Log out',
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
