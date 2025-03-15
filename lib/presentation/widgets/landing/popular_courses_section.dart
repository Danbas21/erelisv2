import 'package:erelis/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:erelis/data/models/course_model.dart';
import 'package:erelis/presentation/blocs/courses/courses_bloc.dart';
import 'package:erelis/presentation/blocs/courses/courses_state.dart';
import 'package:erelis/presentation/widgets/common/custom_button.dart';
import 'package:erelis/presentation/widgets/animations/fade_in_animation.dart';

class PopularCoursesSection extends StatelessWidget {
  const PopularCoursesSection({super.key});

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
            vertical: 40,
            horizontal: isMobile ? 20 : 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(),
              SizedBox(height: 30),

              // Cursos populares
              BlocBuilder<CoursesBloc, CoursesState>(
                builder: (context, state) {
                  if (state is CoursesLoading) {
                    return _buildLoadingIndicator();
                  } else if (state is CoursesError) {
                    return _buildErrorWidget(state.message);
                  } else if (state is CoursesLoaded) {
                    return _buildCoursesGrid(
                      context,
                      state.courses,
                      isMobile: isMobile,
                      isTablet: isTablet,
                    );
                  }

                  return SizedBox.shrink();
                },
              ),

              SizedBox(height: 30),
              Center(
                child: CustomButton(
                  text: 'Explora',
                  onPressed: () {
                    // Navegar a la página de cursos completa
                  },
                  width: 180,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FadeInAnimation(
          delay: Duration(milliseconds: 200),
          child: Text(
            'Populares',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        FadeInAnimation(
          delay: Duration(milliseconds: 300),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.grid_view_rounded,
                  color: AppColors.primaryOrange,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      height: 300,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryLightBlue),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String message) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Text(
          'Error al cargar cursos: $message',
          style: TextStyle(color: AppColors.error),
        ),
      ),
    );
  }

  Widget _buildCoursesGrid(
    BuildContext context,
    List<CourseModel> courses, {
    required bool isMobile,
    required bool isTablet,
  }) {
    // Filtrar solo los cursos populares
    final popularCourses = courses.where((course) => course.isPopular).toList();

    // Determinar el número de columnas según el tamaño de pantalla
    final crossAxisCount = isMobile
        ? 1
        : isTablet
            ? 2
            : 3;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: isMobile ? 1.3 : 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: popularCourses.length,
      itemBuilder: (context, index) {
        return FadeInAnimation(
          delay: Duration(milliseconds: 300 + (index * 100)),
          child: _buildCourseCard(context, popularCourses[index]),
        );
      },
    );
  }

  Widget _buildCourseCard(BuildContext context, CourseModel course) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado del curso con etiquetas
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Etiquetas (Live, Recurrente, etc.)
                Row(
                  children: [
                    if (course.isRecurrent)
                      _buildCourseTag(
                        text: 'Recurrente',
                        color: AppColors.primaryGreen,
                      ),
                    if (course.isLive) ...[
                      if (course.isRecurrent) SizedBox(width: 8),
                      _buildCourseTag(
                        text: 'En vivo',
                        color: AppColors.primaryOrange,
                      ),
                    ],
                  ],
                ),

                // Botón de info o favoritos
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.more_horiz,
                    color: AppColors.textSecondary,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),

          // Título del curso
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              course.title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Spacer(),

          // Botón de acción e información del instructor
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: 'Iniciar',
                  onPressed: () {
                    // Navegar al detalle del curso
                  },
                  type: ButtonType.filled,
                  backgroundColor: AppColors.primaryGreen,
                  height: 36,
                ),

                // Avatar del instructor
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.3),
                    image: DecorationImage(
                      image: AssetImage(course.instructorAvatar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseTag({required String text, required Color color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
