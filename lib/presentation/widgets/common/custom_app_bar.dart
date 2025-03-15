import 'package:erelis/config/app_colors.dart';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:erelis/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:erelis/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:erelis/presentation/blocs/navigation/navigation_event.dart';
import 'package:erelis/presentation/widgets/common/custom_button.dart';
import 'package:erelis/config/routes.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  CustomAppBarState createState() => CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}

class CustomAppBarState extends State<CustomAppBar> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildLogo(),
              if (!isMobile) ...[
                SizedBox(width: 40),
                Expanded(child: _buildNavItems()),
              ],
            ],
          ),
          actions: [
            if (!isMobile) ...[
              _buildActionButtons(),
              SizedBox(width: 20),
            ] else ...[
              IconButton(
                icon: Icon(_isMenuOpen ? Icons.close : Icons.menu),
                onPressed: () {
                  setState(() {
                    _isMenuOpen = !_isMenuOpen;
                  });
                },
              ),
              SizedBox(width: 10),
            ],
          ],
          bottom: isMobile && _isMenuOpen
              ? PreferredSize(
                  preferredSize: Size.fromHeight(250),
                  child: Container(
                    color: AppColors.cardBackground,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMobileNavItems(),
                        SizedBox(height: 15),
                        _buildMobileActionButtons(),
                      ],
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: () {
        NavigationService().navigateTo(AppRoutes.landing);
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            _buildSvgWithFallback(ImagesUtils.logo,
                width: 55, height: 55, fallbackIcon: Icons.school),
            SizedBox(width: 8),
            _buildSvgWithFallback(ImagesUtils.iconLogo,
                width: 40, height: 40, fallbackIcon: Icons.bookmark),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para manejar errores en la carga de SVG
  Widget _buildSvgWithFallback(String assetPath,
      {required double width,
      required double height,
      required IconData fallbackIcon}) {
    try {
      return SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        placeholderBuilder: (context) => Icon(
          fallbackIcon,
          size: width,
          color: Colors.white70,
        ),
      );
    } catch (e) {
      print('Error al cargar SVG: $e');
      return Icon(
        fallbackIcon,
        size: width,
        color: Colors.white70,
      );
    }
  }

  Widget _buildNavItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildNavItem('Home', () => _navigateToSection('hero')),
        _buildNavItem('Cursos', () => _navigateToSection('courses')),
        _buildNavItem('Acerca', () => {}), // Implementar más adelante
        _buildNavItem('Blog', () => {}), // Implementar más adelante
        _buildNavItem('Contacto', () => {}), // Implementar más adelante
      ],
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNavItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMobileNavItem('Home', () => _navigateToSection('hero')),
        _buildMobileNavItem('Cursos', () => _navigateToSection('courses')),
        _buildMobileNavItem('Acerca', () => {}),
        _buildMobileNavItem('Blog', () => {}),
        _buildMobileNavItem('Contacto', () => {}),
      ],
    );
  }

  Widget _buildMobileNavItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            _isMenuOpen = false;
          });
          onTap();
        },
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        CustomButton(
          text: 'Ingresar',
          onPressed: () {
            NavigationService().navigateTo(AppRoutes.login);
          },
          type: ButtonType.outlined,
          height: 50,
          width: 100,
        ),
        SizedBox(width: 10),
        CustomButton(
          text: 'Registrarse',
          onPressed: () {
            NavigationService().navigateTo(AppRoutes.register);
          },
          type: ButtonType.filled,
          height: 50,
          width: 100,
        ),
      ],
    );
  }

  Widget _buildMobileActionButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButton(
          text: 'Ingresar',
          onPressed: () {
            setState(() {
              _isMenuOpen = false;
            });
            NavigationService().navigateTo(AppRoutes.login);
          },
          type: ButtonType.outlined,
        ),
        SizedBox(height: 10),
        CustomButton(
          text: 'Registrarse',
          onPressed: () {
            setState(() {
              _isMenuOpen = false;
            });
            NavigationService().navigateTo(AppRoutes.register);
          },
          type: ButtonType.filled,
        ),
      ],
    );
  }

  void _navigateToSection(String sectionKey) {
    context.read<NavigationBloc>().add(
          NavigateToSection(sectionKey: sectionKey),
        );
  }
}
