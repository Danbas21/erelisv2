import 'package:erelis/config/app_colors.dart';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:erelis/presentation/widgets/common/custom_button.dart';
import 'package:erelis/presentation/widgets/animations/fade_in_animation.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

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
              // Título de la sección
              FadeInAnimation(
                delay: Duration(milliseconds: 200),
                child: Column(
                  children: [
                    Text(
                      'Preguntas Frecuentes:',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Alguna Pregunta? encuéntrala aquí.',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              // Contenido principal
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
        // Acordeón de preguntas a la izquierda
        Expanded(flex: 7, child: _buildFaqAccordion()),
        SizedBox(width: 40),

        // Ilustración y botón a la derecha
        Expanded(
          flex: 3,
          child: Column(
            children: [
              FadeInAnimation(
                delay: Duration(milliseconds: 600),
                child: SvgPicture.asset(ImagesUtils.student02, height: 400),
              ),
              SizedBox(height: 30),
              FadeInAnimation(
                delay: Duration(milliseconds: 700),
                child: CustomButton(
                  text: 'Enviar mensaje',
                  icon: Icons.mail_outline,
                  onPressed: () {
                    // Abrir formulario de contacto
                  },
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Acordeón de preguntas
        _buildFaqAccordion(),

        // Ilustración y botón
        SizedBox(height: 40),
        FadeInAnimation(
          delay: Duration(milliseconds: 600),
          child: SvgPicture.asset(ImagesUtils.student02, height: 150),
        ),
        SizedBox(height: 20),
        FadeInAnimation(
          delay: Duration(milliseconds: 700),
          child: CustomButton(
            text: 'Enviar mensaje',
            icon: Icons.mail_outline,
            onPressed: () {
              // Abrir formulario de contacto
            },
            width: 200,
          ),
        ),
      ],
    );
  }

  Widget _buildFaqAccordion() {
    return Column(
      children: [
        FadeInAnimation(
          delay: Duration(milliseconds: 300),
          child: _buildFaqItem(
            question: 'Tengo que tener código para registrar?',
            answer:
                'No, el registro en Erelis es completamente abierto. Solo necesitas proporcionar tu información básica como correo electrónico y crear una contraseña para comenzar.',
          ),
        ),
        SizedBox(height: 16),
        FadeInAnimation(
          delay: Duration(milliseconds: 400),
          child: _buildFaqItem(
            question: 'Hay un límite de estudiantes por cada universidad?',
            answer:
                'No hay límite en la cantidad de estudiantes que pueden prepararse para una universidad específica. Todos nuestros cursos están diseñados para dar cabida a cualquier número de estudiantes sin comprometer la calidad educativa.',
          ),
        ),
        SizedBox(height: 16),
        FadeInAnimation(
          delay: Duration(milliseconds: 500),
          child: _buildFaqItem(
            question: 'Como desbloqueo mis cursos después de pagar?',
            answer:
                'Una vez realizado el pago, tus cursos se desbloquearán automáticamente en tu cuenta. Si experimentas algún problema, simplemente contacta a nuestro soporte técnico y te ayudaremos inmediatamente.',
          ),
        ),
        SizedBox(height: 16),
        FadeInAnimation(
          delay: Duration(milliseconds: 550),
          child: _buildFaqItem(
            question: 'Cuáles son nuestros horarios de circulación?',
            answer:
                'Nuestras plataforma está disponible 24/7 para acceder a contenido grabado. Las clases en vivo tienen horarios específicos que varían según el curso y profesor, los cuales podrás consultar en la descripción detallada de cada curso.',
          ),
        ),
      ],
    );
  }

  Widget _buildFaqItem({required String question, required String answer}) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      collapsedIconColor: AppColors.textPrimary,
      iconColor: AppColors.primaryLightBlue,
      backgroundColor: AppColors.background,
      collapsedBackgroundColor: AppColors.background,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            answer,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
