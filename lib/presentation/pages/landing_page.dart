import 'package:erelis/config/app_colors.dart';
import 'package:erelis/config/routes.dart';
import 'package:erelis/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:erelis/presentation/blocs/navigation/navigation_state.dart';
import 'package:erelis/presentation/widgets/common/custom_app_bar.dart';
import 'package:erelis/presentation/widgets/landing/hero_section.dart';
import 'package:erelis/presentation/widgets/landing/stats_section.dart';
import 'package:erelis/presentation/widgets/landing/categories_carousel.dart';
import 'package:erelis/presentation/widgets/landing/popular_courses_section.dart';
import 'package:erelis/presentation/widgets/landing/how_to_use_section.dart';
import 'package:erelis/presentation/widgets/landing/faq_section.dart';
import 'package:erelis/presentation/widgets/landing/testimonials_section.dart';
import 'package:erelis/presentation/widgets/landing/footer_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  // Referencias para la navegación entre secciones
  final Map<String, GlobalKey> _sectionKeys = {
    'hero': GlobalKey(),
    'courses': GlobalKey(),
    'howToUse': GlobalKey(),
    'faq': GlobalKey(),
    'testimonials': GlobalKey(),
  };

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Escuchar cambios en el NavigationBloc para manejar la navegación entre secciones
    BlocProvider.of<NavigationBloc>(context).stream.listen((state) {
      if (state is NavigationToSection &&
          _sectionKeys.containsKey(state.sectionKey)) {
        _scrollToSection(state.sectionKey);
      }
    });
  }

  void _scrollToSection(String sectionKey) {
    final RenderBox renderBox = _sectionKeys[sectionKey]!
        .currentContext!
        .findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero).dy;

    _scrollController.animateTo(
      position - 80, // Ajuste para el AppBar
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // Navega a la ruta de diagnóstico cuando el usuario está autenticado
          Navigator.of(context).pushReplacementNamed(AppRoutes.salon);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // Hero Section
              HeroSection(key: _sectionKeys['hero']),

              // Stats Section
              StatsSection(),

              // Categories Carousel
              CategoriesCarousel(),

              // Popular Courses Section
              PopularCoursesSection(key: _sectionKeys['courses']),

              // How to Use Section
              HowToUseSection(key: _sectionKeys['howToUse']),

              // FAQ Section
              FAQSection(key: _sectionKeys['faq']),

              // Testimonials Section
              TestimonialsSection(key: _sectionKeys['testimonials']),

              // Footer Section
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
