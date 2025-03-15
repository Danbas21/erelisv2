import 'package:erelis/config/app_colors.dart';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:erelis/presentation/widgets/animations/fade_in_animation.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
            vertical: isMobile ? 40 : 60,
            horizontal: isMobile ? 20 : 40,
          ),
          child: Column(
            children: [
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: FadeInAnimation(
            delay: Duration(milliseconds: 400),
            child: _buildIllustration(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeInAnimation(
          delay: Duration(milliseconds: 400),
          child: _buildIllustration(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Prepárate con nosotros',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 40,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'desde cualquier lugar con profesores ',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              TextSpan(
                text: 'expertos',
                style: TextStyle(
                  color: AppColors.primaryOrange,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryOrange,
                  decorationThickness: 2,
                ),
              ),
              TextSpan(text: ' ✨', style: TextStyle(fontSize: 32, height: 1.2)),
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          'consigue el ingreso a la preparatoria o universidad que quieras',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildIllustration() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Elementos decorativos
        Positioned(
          left: 30,
          bottom: 50,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryLightBlue.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Positioned(
          right: 40,
          top: 30,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withValues(alpha: .2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.star,
              color: AppColors.primaryGreen.withValues(alpha: .7),
              size: 30,
            ),
          ),
        ),

        // Ilustraciones principales
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Personaje izquierdo (estudiante sentado)
            Expanded(
              child: SizedBox(
                width: 300,
                height: 500,
                child: Stack(
                  children: [
                    Positioned(
                      child: SvgPicture.asset(
                        ImagesUtils.form1,
                        height: 500,
                        width: 150,
                      ),
                    ),
                    Positioned(
                      top: 80,
                      child: SvgPicture.asset(
                        ImagesUtils.menSit,
                        height: 300,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 50),
            _buildContent(),
            // Personaje derecho (profesor)
            SizedBox(
              width: 300,
              height: 500,
              child: Stack(
                children: [
                  Positioned(
                    child: SvgPicture.asset(
                      ImagesUtils.form2,
                      height: 500,
                      width: 150,
                    ),
                  ),
                  Positioned(
                    top: 80,
                    child: SvgPicture.asset(
                      ImagesUtils.womanSit,
                      height: 300,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
