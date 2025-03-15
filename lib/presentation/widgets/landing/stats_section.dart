import 'package:erelis/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:erelis/presentation/widgets/animations/counter_animation.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: isMobile ? 20 : 40,
          ),
          child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        );
      },
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard(
          icon: Icons.people,
          value: 60,
          unit: 'k+',
          label: 'alumnos',
          color: AppColors.primaryGreen,
        ),
        _buildDivider(),
        _buildStatCard(
          icon: Icons.school,
          value: 25,
          unit: '+',
          label: 'programas',
          color: AppColors.primaryLightBlue,
        ),
        _buildDivider(),
        _buildStatCard(
          icon: Icons.star,
          value: 4.9,
          hasDecimal: true,
          label: 'calificación en opiniones',
          color: AppColors.primaryOrange,
        ),
        _buildDivider(),
        _buildStatCard(
          icon: Icons.person,
          value: 50,
          unit: '+',
          label: 'profesores',
          color: AppColors.secondaryTeal,
        ),
        _buildDivider(),
        _buildStatCard(
          icon: Icons.work,
          value: 12,
          unit: 'k+',
          label: 'proyectos',
          color: AppColors.secondaryYellow,
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.people,
                value: 60,
                unit: 'k+',
                label: 'alumnos',
                color: AppColors.primaryGreen,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _buildStatCard(
                icon: Icons.school,
                value: 25,
                unit: '+',
                label: 'programas',
                color: AppColors.primaryLightBlue,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.star,
                value: 4.9,
                hasDecimal: true,
                label: 'calificación en opiniones',
                color: AppColors.primaryOrange,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _buildStatCard(
                icon: Icons.person,
                value: 50,
                unit: '+',
                label: 'profesores',
                color: AppColors.secondaryTeal,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        _buildStatCard(
          icon: Icons.work,
          value: 12,
          unit: 'k+',
          label: 'proyectos',
          color: AppColors.secondaryYellow,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required double value,
    String unit = '',
    required String label,
    required Color color,
    bool hasDecimal = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: color.withValues(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 30),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              CounterAnimation(
                value: value,
                hasDecimal: hasDecimal,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (unit.isNotEmpty)
                Text(
                  unit,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 40, width: 1, color: AppColors.divider);
  }
}
