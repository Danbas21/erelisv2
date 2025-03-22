// lib/presentation/widgets/unit_list/sidebar_navigation.dart
import 'package:erelis/config/app_colors.dart';
import 'package:flutter/material.dart';

class SidebarNavigation extends StatelessWidget {
  const SidebarNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cardBackground,
      child: Column(
        children: [
          // Cabecera con perfil de usuario
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.divider,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                // Foto de perfil
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/48',
                  ),
                ),

                const SizedBox(width: 12),
                // Nombre del usuario
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre Estudiante',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        'Estudiante',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Lista de opciones de navegación
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildNavItem(
                  context,
                  icon: Icons.calendar_today,
                  label: 'Calendario',
                  onTap: () {
                    // Navegar al calendario
                  },
                ),
                _buildNavItem(
                  context,
                  icon: Icons.school,
                  label: 'Salón',
                  onTap: () {
                    // Navegar al salón
                  },
                ),
                _buildNavItem(
                  context,
                  icon: Icons.menu_book,
                  label: 'Librería',
                  onTap: () {
                    // Navegar a la librería
                  },
                ),
                _buildNavItem(
                  context,
                  icon: Icons.auto_stories,
                  label: 'Cursos',
                  onTap: () {
                    // Navegar a cursos
                  },
                  isActive: true, // Esta es la sección activa
                ),
                _buildNavItem(
                  context,
                  icon: Icons.link,
                  label: 'Integraciones',
                  onTap: () {
                    // Navegar a integraciones
                  },
                ),
                _buildNavItem(
                  context,
                  icon: Icons.people,
                  label: 'Asistencia',
                  onTap: () {
                    // Navegar a asistencia
                  },
                ),
                _buildNavItem(
                  context,
                  icon: Icons.message,
                  label: 'Mensajes',
                  onTap: () {
                    // Navegar a mensajes
                  },
                ),
                _buildNavItem(
                  context,
                  icon: Icons.help,
                  label: 'Ayuda',
                  onTap: () {
                    // Navegar a ayuda
                  },
                ),
              ],
            ),
          ),

          // Sección inferior (Configuración y cierre de sesión)
          Column(
            children: [
              Divider(color: AppColors.divider, height: 1),
              _buildNavItem(
                context,
                icon: Icons.settings,
                label: 'Configuración',
                onTap: () {
                  // Navegar a configuración
                },
              ),
              _buildNavItem(
                context,
                icon: Icons.logout,
                label: 'Cerrar sesión',
                onTap: () {
                  // Cerrar sesión
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? AppColors.primaryLightBlue : AppColors.textPrimary,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.primaryLightBlue : AppColors.textPrimary,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
      tileColor:
          isActive ? AppColors.primaryLightBlue.withValues(alpha: 0.2) : null,
    );
  }
}
