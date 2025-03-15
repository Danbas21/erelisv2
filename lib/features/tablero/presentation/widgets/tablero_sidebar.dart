import 'package:flutter/material.dart';
import 'package:erelis/config/app_colors.dart';

class TableroSidebar extends StatelessWidget {
  const TableroSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      color: AppColors.primaryDarkBlue,
      child: Column(
        children: [
          const SizedBox(height: 24),

          // Logo
          Container(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/images/logo.png',
              width: 48,
              height: 48,
            ),
          ),

          const SizedBox(height: 32),

          // Navigation items
          _buildNavItem(
            icon: Icons.dashboard_outlined,
            label: 'Tablero',
            isSelected: true,
            onTap: () {},
          ),

          _buildNavItem(
            icon: Icons.calendar_today_outlined,
            label: 'Calendario',
            isSelected: false,
            onTap: () {},
          ),

          _buildNavItem(
            icon: Icons.meeting_room_outlined,
            label: 'Salon',
            isSelected: false,
            onTap: () {},
          ),

          _buildNavItem(
            icon: Icons.local_library_outlined,
            label: 'Libreria',
            isSelected: false,
            onTap: () {},
          ),

          _buildNavItem(
            icon: Icons.book_outlined,
            label: 'Cursos',
            isSelected: false,
            onTap: () {},
          ),

          _buildNavItem(
            icon: Icons.link_outlined,
            label: 'Integraciones',
            isSelected: false,
            onTap: () {},
          ),

          _buildNavItem(
            icon: Icons.access_time_outlined,
            label: 'Asistencia',
            isSelected: false,
            onTap: () {},
          ),

          _buildNavItem(
            icon: Icons.chat_bubble_outline,
            label: 'Mensajes',
            isSelected: false,
            onTap: () {},
          ),

          const Spacer(),

          _buildNavItem(
            icon: Icons.help_outline,
            label: 'Ayuda',
            isSelected: false,
            onTap: () {},
          ),

          _buildNavItem(
            icon: Icons.settings_outlined,
            label: 'Configuración',
            isSelected: false,
            onTap: () {},
          ),

          _buildNavItem(
            icon: Icons.logout_outlined,
            label: 'Cerrar sesión',
            isSelected: false,
            onTap: () {
              // TODO: Implement logout logic
            },
            showSelectedIndicator: false,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    bool showSelectedIndicator = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: isSelected ? AppColors.cardBackground : Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isSelected && showSelectedIndicator)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 3,
                  color: AppColors.primaryLightBlue,
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? AppColors.primaryLightBlue
                      : AppColors.textSecondary,
                  size: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    color: isSelected
                        ? AppColors.primaryLightBlue
                        : AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
