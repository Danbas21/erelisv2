// presentation/widgets/sidebar_widget.dart
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/config/responsive_utils.dart';
import 'package:flutter/material.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final double sidebarWidth = ResponsiveUtils.getSidebarWidth(context);

    return Container(
      width: sidebarWidth,
      decoration: BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(-2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildSidebarItem(
                  context,
                  Icons.calendar_today,
                  'Calendario',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.school,
                  'Salón',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.book,
                  'Librería',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.library_books,
                  'Cursos',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.link,
                  'Integraciones',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.list_alt,
                  'Asistencia',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.message,
                  'Mensajes',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.help,
                  'Ayuda',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.settings,
                  'Configuración',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
              ],
            ),
          ),
          _buildSidebarItem(
            context,
            Icons.logout,
            'Logout',
            isDesktop: isDesktop,
            isTablet: isTablet,
            isLogout: true,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(
    BuildContext context,
    IconData icon,
    String label, {
    required bool isDesktop,
    required bool isTablet,
    bool isLogout = false,
  }) {
    return Tooltip(
      message: label,
      preferBelow: false,
      verticalOffset: 20,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Aquí iría la navegación o acción correspondiente
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navegando a $label')),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isLogout ? AppColors.error : Colors.white,
                  size: isDesktop ? 28 : 24,
                ),
                if (isDesktop || isTablet) const SizedBox(height: 4),
                if (isDesktop)
                  Text(
                    label,
                    style: TextStyle(
                      color: isLogout ? AppColors.error : Colors.white,
                      fontSize: 12,
                    ),
                  )
                else if (isTablet)
                  Text(
                    label.characters.first,
                    style: TextStyle(
                      color: isLogout ? AppColors.error : Colors.white,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
