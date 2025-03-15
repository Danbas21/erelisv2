import 'package:erelis/config/app_colors.dart';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:erelis/presentation/widgets/animations/fade_in_animation.dart';

class HowToUseSection extends StatelessWidget {
  const HowToUseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        final isTablet =
            sizingInformation.deviceScreenType == DeviceScreenType.tablet;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: isMobile ? 20 : 40,
          ),
          child: Column(
            children: [
              FadeInAnimation(
                delay: Duration(milliseconds: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Como usar Ere',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'lis',
                      style: TextStyle(
                        color: AppColors.primaryLightBlue,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              // Pasos
              isMobile || isTablet
                  ? _buildMobileLayout()
                  : _buildDesktopLayout(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pasos a la izquierda
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStepItem(
                index: 1,
                icon: Icons.app_registration,
                title: 'Inscríbete',
                description:
                    'Crea una cuenta, es totalmente rápido y fácil. Puedes registrarte con un correo, cuenta de redes sociales, o SMS.',
                color: AppColors.primaryOrange,
                delay: Duration(milliseconds: 300),
              ),
              SizedBox(height: 30),
              _buildStepItem(
                index: 2,
                icon: Icons.school,
                title: 'Selecciona tu curso',
                description:
                    'Busca y encuentra el curso que responda a tus necesidades.',
                color: AppColors.primaryGreen,
                delay: Duration(milliseconds: 400),
              ),
              SizedBox(height: 30),
              _buildStepItem(
                index: 3,
                icon: Icons.payment,
                title: 'Selecciona el método de pago',
                description:
                    'Puedes pagar a plazos, de contado o cualquier método de pago que se adapte a tus necesidades.',
                color: AppColors.primaryLightBlue,
                delay: Duration(milliseconds: 500),
              ),
            ],
          ),
        ),

        // Ilustración a la derecha
        Expanded(
          flex: 4,
          child: FadeInAnimation(
            delay: Duration(milliseconds: 600),
            child: SvgPicture.asset(ImagesUtils.student01, height: 400),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Primero los pasos
        _buildStepItem(
          index: 1,
          icon: Icons.app_registration,
          title: 'Inscríbete',
          description:
              'Crea una cuenta, es totalmente rápido y fácil. Puedes registrarte con un correo, cuenta de redes sociales, o SMS.',
          color: AppColors.primaryOrange,
          delay: Duration(milliseconds: 300),
        ),
        SizedBox(height: 20),
        _buildStepItem(
          index: 2,
          icon: Icons.school,
          title: 'Selecciona tu curso',
          description:
              'Busca y encuentra el curso que responda a tus necesidades.',
          color: AppColors.primaryGreen,
          delay: Duration(milliseconds: 400),
        ),
        SizedBox(height: 20),
        _buildStepItem(
          index: 3,
          icon: Icons.payment,
          title: 'Selecciona el método de pago',
          description:
              'Puedes pagar a plazos, de contado o cualquier método de pago que se adapte a tus necesidades.',
          color: AppColors.primaryLightBlue,
          delay: Duration(milliseconds: 500),
        ),

        // Luego la ilustración
        SizedBox(height: 30),
        FadeInAnimation(
          delay: Duration(milliseconds: 600),
          child: SvgPicture.asset(ImagesUtils.student01, height: 300),
        ),
      ],
    );
  }

  Widget _buildStepItem({
    required int index,
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required Duration delay,
  }) {
    return FadeInAnimation(
      delay: delay,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono con círculo numerado
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .1),
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(icon, color: color, size: 24)),
            ),
            SizedBox(width: 16),

            // Contenido del paso
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
