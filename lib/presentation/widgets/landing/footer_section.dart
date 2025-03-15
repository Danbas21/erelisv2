import 'package:erelis/config/app_colors.dart';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:erelis/presentation/widgets/common/custom_button.dart';
import 'package:erelis/presentation/widgets/animations/fade_in_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

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
          color: AppColors.secondaryBlue.withOpacity(0.3),
          padding: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: isMobile ? 20 : 40,
          ),
          child: Column(
            children: [
              // Contenido principal del footer
              isMobile ? _buildMobileFooter() : _buildDesktopFooter(),

              SizedBox(height: 40),

              // Divider
              Divider(color: AppColors.divider),

              SizedBox(height: 20),

              // Copyright y enlaces de redes sociales
              _buildBottomFooter(isMobile),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo y texto
        Expanded(
          flex: 3,
          child: FadeInAnimation(
            delay: Duration(milliseconds: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLogo(),
                SizedBox(height: 20),
                Text(
                  'Más que una plataforma de preparación es un lugar donde cada estudiante puede lograr sus metas académicas.',
                  style: TextStyle(color: AppColors.textSecondary, height: 1.6),
                ),
              ],
            ),
          ),
        ),

        SizedBox(width: 80),

        // Enlaces rápidos
        Expanded(
          flex: 2,
          child: FadeInAnimation(
            delay: Duration(milliseconds: 300),
            child: _buildLinksColumn(
              title: 'Enlaces',
              links: [
                {'text': 'Inicio', 'onTap': () {}},
                {'text': 'Cursos', 'onTap': () {}},
                {'text': 'Acerca', 'onTap': () {}},
                {'text': 'Blog', 'onTap': () {}},
                {'text': 'Contacto', 'onTap': () {}},
              ],
            ),
          ),
        ),

        // Enlaces legales
        Expanded(
          flex: 2,
          child: FadeInAnimation(
            delay: Duration(milliseconds: 400),
            child: _buildLinksColumn(
              title: 'Legal',
              links: [
                {'text': 'Términos', 'onTap': () {}},
                {'text': 'Privacidad', 'onTap': () {}},
                {'text': 'Cookies', 'onTap': () {}},
                {'text': 'Condiciones', 'onTap': () {}},
                {'text': 'Licencias', 'onTap': () {}},
              ],
            ),
          ),
        ),

        // Formulario de suscripción
        Expanded(
          flex: 3,
          child: FadeInAnimation(
            delay: Duration(milliseconds: 500),
            child: _buildSubscriptionForm(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo y texto
        FadeInAnimation(
          delay: Duration(milliseconds: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogo(),
              SizedBox(height: 20),
              Text(
                'Más que una plataforma de preparación es un lugar donde cada estudiante puede lograr sus metas académicas.',
                style: TextStyle(color: AppColors.textSecondary, height: 1.6),
              ),
            ],
          ),
        ),

        SizedBox(height: 40),

        // Enlaces en formato de rejilla
        FadeInAnimation(
          delay: Duration(milliseconds: 300),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Enlaces rápidos
              Expanded(
                child: _buildLinksColumn(
                  title: 'Enlaces',
                  links: [
                    {'text': 'Inicio', 'onTap': () {}},
                    {'text': 'Cursos', 'onTap': () {}},
                    {'text': 'Acerca', 'onTap': () {}},
                    {'text': 'Blog', 'onTap': () {}},
                    {'text': 'Contacto', 'onTap': () {}},
                  ],
                ),
              ),

              // Enlaces legales
              Expanded(
                child: _buildLinksColumn(
                  title: 'Legal',
                  links: [
                    {'text': 'Términos', 'onTap': () {}},
                    {'text': 'Privacidad', 'onTap': () {}},
                    {'text': 'Cookies', 'onTap': () {}},
                    {'text': 'Condiciones', 'onTap': () {}},
                    {'text': 'Licencias', 'onTap': () {}},
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 40),

        // Formulario de suscripción
        FadeInAnimation(
          delay: Duration(milliseconds: 400),
          child: _buildSubscriptionForm(),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              SvgPicture.asset(ImagesUtils.logo, width: 55, height: 55),
              SizedBox(width: 8),
              SvgPicture.asset(ImagesUtils.iconLogo, width: 40, height: 40),
            ],
          ),
        ),
        SizedBox(width: 8),
      ],
    );
  }

  Widget _buildLinksColumn({
    required String title,
    required List<Map<String, dynamic>> links,
  }) {
    return Column(
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
        SizedBox(height: 20),
        ...links.map(
          (link) => Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: link['onTap'],
              child: Text(
                link['text'],
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriptionForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comentarios',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Suscríbete a nuestro newsletter para recibir actualizaciones importantes.',
          style: TextStyle(color: AppColors.textSecondary, height: 1.6),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  style: TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Correo electrónico',
                    hintStyle: TextStyle(color: AppColors.textSecondary),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            CustomButton(text: 'Suscribirse', onPressed: () {}, height: 48),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomFooter(bool isMobile) {
    final currentYear = DateTime.now().year;

    return isMobile
        ? Column(
            children: [
              _buildSocialIcons(),
              SizedBox(height: 20),
              Text(
                '© $currentYear Erelis. Todos los derechos reservados.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© $currentYear Erelis. Todos los derechos reservados.',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
              _buildSocialIcons(),
            ],
          );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(FontAwesomeIcons.facebook),
        _buildSocialIcon(FontAwesomeIcons.twitter),
        _buildSocialIcon(FontAwesomeIcons.instagram),
        _buildSocialIcon(FontAwesomeIcons.linkedin),
        _buildSocialIcon(FontAwesomeIcons.youtube),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: FaIcon(icon, color: AppColors.textPrimary, size: 18),
      ),
    );
  }
}
