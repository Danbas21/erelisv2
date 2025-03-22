// presentation/widgets/unit_card_widget.dart
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/unit.dart';

class UnitCardWidget extends StatefulWidget {
  final Unit unit;

  const UnitCardWidget({super.key, required this.unit});

  @override
  State<UnitCardWidget> createState() => _UnitCardWidgetState();
}

class _UnitCardWidgetState extends State<UnitCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: widget.unit.isCompleted
            ? BorderSide(color: AppColors.success.withOpacity(0.3), width: 2)
            : BorderSide.none,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: widget.unit.isCompleted
                    ? AppColors.success
                    : AppColors.primary,
                width: 4,
              ),
            ),
          ),
          child: Stack(
            children: [
              // Contenido principal
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Icono de la unidad
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: widget.unit.isCompleted
                                ? AppColors.success.withOpacity(0.1)
                                : AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            widget.unit.isCompleted
                                ? Icons.check_circle_outline
                                : Icons.book_outlined,
                            color: widget.unit.isCompleted
                                ? AppColors.success
                                : AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Título de la unidad
                        Expanded(
                          child: Text(
                            widget.unit.title,
                            style: AppTextStyles.unitTitle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Estado de la unidad
                        _buildStatusChip(context),
                        // Fecha de última visita
                        Text(
                          'Última visita: ${_formatDate(widget.unit.lastVisited)}',
                          style: AppTextStyles.unitSubtitle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Indicador de completado (esquina)
              if (widget.unit.isCompleted)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              // Sombra superior para dar profundidad
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 6,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.05),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: widget.unit.isCompleted
            ? AppColors.success.withOpacity(0.1)
            : AppColors.warning.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.unit.isCompleted ? Icons.check_circle : Icons.access_time,
            size: 16,
            color:
                widget.unit.isCompleted ? AppColors.success : AppColors.warning,
          ),
          const SizedBox(width: 4),
          Text(
            widget.unit.isCompleted ? 'Completada' : 'Pendiente',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: widget.unit.isCompleted
                  ? AppColors.success
                  : AppColors.warning,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
