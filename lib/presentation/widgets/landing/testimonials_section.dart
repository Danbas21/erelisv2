import 'package:erelis/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:erelis/data/models/testimonial_model.dart';
import 'package:erelis/presentation/widgets/animations/fade_in_animation.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  _TestimonialsSectionState createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // Mock data para testimonios
  final List<TestimonialModel> _testimonials =
      TestimonialModel.getMockTestimonials();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile;

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
                child: Text(
                  'Que dicen de Erelis?',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 50),

              // Testimonio principal
              FadeInAnimation(
                delay: Duration(milliseconds: 300),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      // Icono de comillas
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Image.asset(
                          'assets/icons/quote.png',
                          height: 50,
                          color: AppColors.primaryOrange,
                        ),
                      ),

                      // Carrusel de testimonios
                      SizedBox(
                        height: 120,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: _testimonials.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return _buildTestimonialContent(
                              _testimonials[index],
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30),

                      // Indicadores de página
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _testimonials.length,
                          (index) => _buildPageIndicator(index == _currentPage),
                        ),
                      ),

                      SizedBox(height: 30),

                      // Información del cliente
                      Text(
                        _testimonials[_currentPage].name,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Avatares de otros clientes
              FadeInAnimation(
                delay: Duration(milliseconds: 400),
                child: _buildAvatarRow(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTestimonialContent(TestimonialModel testimonial) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        testimonial.content,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
          height: 1.6,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primaryOrange
            : AppColors.textSecondary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildAvatarRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvatar('assets/images/testimonials/avatar1.png'),
        _buildPositionedAvatar(
          'assets/images/testimonials/avatar2.png',
          isCenter: true,
        ),
        _buildAvatar('assets/images/testimonials/avatar3.png'),
        _buildAvatar('assets/images/testimonials/avatar4.png'),
        _buildAvatar('assets/images/testimonials/avatar5.png'),
      ],
    );
  }

  Widget _buildAvatar(String imagePath) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        border: Border.all(color: AppColors.background, width: 3),
      ),
    );
  }

  Widget _buildPositionedAvatar(String imagePath, {bool isCenter = false}) {
    return Container(
      width: isCenter ? 50 : 40,
      height: isCenter ? 50 : 40,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        border: Border.all(
          color: isCenter ? AppColors.primaryOrange : AppColors.background,
          width: isCenter ? 3 : 2,
        ),
        boxShadow: isCenter
            ? [
                BoxShadow(
                  color: AppColors.primaryOrange.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
    );
  }
}
