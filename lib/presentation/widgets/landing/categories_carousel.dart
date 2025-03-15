import 'package:erelis/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart'
    as responsive_builder;
import 'package:erelis/data/models/category_model.dart';
import 'package:erelis/presentation/blocs/category/category_bloc.dart';
import 'package:erelis/presentation/blocs/category/category_state.dart';
import 'package:erelis/presentation/widgets/animations/fade_in_animation.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CategoriesCarousel extends StatefulWidget {
  const CategoriesCarousel({super.key});

  @override
  _CategoriesCarouselState createState() => _CategoriesCarouselState();
}

class _CategoriesCarouselState extends State<CategoriesCarousel> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return _buildLoadingIndicator();
        } else if (state is CategoryError) {
          return _buildErrorWidget(state.message);
        } else if (state is CategoryLoaded) {
          return _buildCategoriesCarousel(
            state.categories,
            state.selectedCategoryId,
          );
        }

        return SizedBox.shrink();
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      height: 150,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryLightBlue),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String message) {
    return SizedBox(
      height: 150,
      child: Center(
        child: Text(
          'Error al cargar categorías: $message',
          style: TextStyle(color: AppColors.error),
        ),
      ),
    );
  }

  Widget _buildCategoriesCarousel(
    List<CategoryModel> categories,
    String selectedCategoryId,
  ) {
    return responsive_builder.ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        final isTablet =
            sizingInformation.deviceScreenType == DeviceScreenType.tablet;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de sección - Este debería ir primero
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 20,
              ),
              child: FadeInAnimation(
                delay: Duration(milliseconds: 300),
                child: Text(
                  'Explora nuestros curso de admisión',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            // Contenedor del carrusel
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  // Carrusel principal
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return FadeInAnimation(
                          delay: Duration(milliseconds: 300 + (index * 100)),
                          direction: Axis.horizontal,
                          offset: 20,
                          child: _buildCategoryItem(
                            categories[index],
                            isSelected:
                                categories[index].id == selectedCategoryId,
                            isMobile: isMobile,
                          ),
                        );
                      },
                    ),
                  ),

                  // Botones de navegación
                  if (!isMobile) ...[
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: _buildNavigationButton(
                        icon: Icons.chevron_left,
                        onPressed: () {
                          _scrollController.animateTo(
                            _scrollController.offset - 300,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOutCubic,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: _buildNavigationButton(
                        icon: Icons.chevron_right,
                        onPressed: () {
                          _scrollController.animateTo(
                            _scrollController.offset + 300,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOutCubic,
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // Falta agregar estos métodos que se mencionan en el código
  Widget _buildCategoryItem(
    CategoryModel category, {
    required bool isSelected,
    required bool isMobile,
  }) {
    // Implementación faltante
    return Container(); // Implementación provisional
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    // Implementación faltante
    return Container(); // Implementación provisional
  }
}
