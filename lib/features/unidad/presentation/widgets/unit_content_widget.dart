import 'package:erelis/config/app_colors.dart';
import 'package:erelis/config/app_text_styles.dart';
import 'package:erelis/features/unidad/presentation/blocs/unit_detail/unit_detail_bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/unit.dart';

class UnitContentWidget extends StatefulWidget {
  final Unit unit;
  final List<HighlightData> highlights;
  final Function(String) onTextSelected;

  const UnitContentWidget({
    super.key,
    required this.unit,
    required this.highlights,
    required this.onTextSelected,
  });

  @override
  State<UnitContentWidget> createState() => _UnitContentWidgetState();
}

class _UnitContentWidgetState extends State<UnitContentWidget> {
  TextSelection? currentSelection;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Título
            Text(
              widget.unit.title,
              style: AppTextStyles.notebookTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Icono de comillas (reemplaza la imagen faltante)
            Icon(
              Icons.format_quote,
              size: 32,
              color: Colors.blue.shade300,
            ),

            // Contenido con cuadrícula simulada
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 247, 247),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CustomPaint(
                painter: GridPainter(),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: _buildTextContent(),
                ),
              ),
            ),
            // Mostrar los fragmentos destacados
            if (widget.highlights.isNotEmpty) ...[
              const SizedBox(height: 32),
              Text(
                'Fragmentos destacados:',
                style: AppTextStyles.h3,
              ),
              const SizedBox(height: 16),
              ...widget.highlights
                  .map((highlight) => _buildHighlightCard(highlight)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    // Si no hay resaltados, mostrar texto normal
    if (widget.highlights.isEmpty) {
      return SelectableText(
        widget.unit.content,
        style: AppTextStyles.notebookContent,
        onSelectionChanged: _handleSelectionChange,
      );
    }

    // Si hay resaltados, construir texto rico
    return SelectableText.rich(
      TextSpan(
        children: _buildHighlightedTextSpans(),
      ),
      style: AppTextStyles.notebookContent,
      onSelectionChanged: _handleSelectionChange,
    );
  }

  void _handleSelectionChange(
      TextSelection selection, SelectionChangedCause? cause) {
    if (selection.baseOffset == selection.extentOffset) {
      // Evitar procesamiento si no hay selección real
      return;
    }

    // Validar que la selección esté dentro de los límites
    final baseOffset =
        selection.baseOffset.clamp(0, widget.unit.content.length);
    final extentOffset =
        selection.extentOffset.clamp(0, widget.unit.content.length);

    // Asegurar que base < extent
    final start = baseOffset < extentOffset ? baseOffset : extentOffset;
    final end = baseOffset < extentOffset ? extentOffset : baseOffset;

    if (start != end) {
      setState(() {
        currentSelection = TextSelection(baseOffset: start, extentOffset: end);
      });

      try {
        final text = widget.unit.content.substring(start, end);
        if (text.isNotEmpty) {
          widget.onTextSelected(text);
        }
      } catch (e) {
        debugPrint('Error en selección: $e');
      }
    }
  }

  List<TextSpan> _buildHighlightedTextSpans() {
    // Implementación simplificada para mayor robustez
    final List<TextSpan> spans = [];
    final text = widget.unit.content;

    // Para cada porción resaltada
    for (final highlight in widget.highlights) {
      // Verificar si este resaltado está en el texto
      final index = text.indexOf(highlight.text);

      if (index >= 0) {
        // Añadir texto antes del resaltado
        if (index > 0) {
          spans.add(TextSpan(text: text.substring(0, index)));
        }

        // Añadir el texto resaltado
        spans.add(
          TextSpan(
            text: highlight.text,
            style: TextStyle(
              backgroundColor:
                  _getHighlightColor(highlight.color).withValues(alpha: 0.3),
            ),
          ),
        );

        // Continuar con el resto del texto
        if (index + highlight.text.length < text.length) {
          spans.add(
              TextSpan(text: text.substring(index + highlight.text.length)));
        }

        return spans; // Finalizar con el primer resaltado encontrado para simplificar
      }
    }

    // Si no se encontró ningún resaltado, devolver el texto completo
    spans.add(TextSpan(text: text));
    return spans;
  }

  Widget _buildHighlightCard(HighlightData highlight) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: _getHighlightColor(highlight.color),
              width: 4,
            ),
          ),
        ),
        child: Text(
          highlight.text,
          style: AppTextStyles.body1.copyWith(
            backgroundColor:
                _getHighlightColor(highlight.color).withValues(alpha: 0.1),
          ),
        ),
      ),
    );
  }

  Color _getHighlightColor(String color) {
    switch (color.toLowerCase()) {
      case 'naranja':
        return AppColors.highlightOrange;
      case 'verde':
        return AppColors.highlightGreen;
      case 'amarillo':
        return AppColors.highlightYellow;
      default:
        return AppColors.highlightYellow;
    }
  }
}

// Clase para dibujar la cuadrícula
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade200.withValues(alpha: 0.2)
      ..strokeWidth = 0.5;

    const gridSize = 24.0; // Tamaño de cada cuadro

    // Dibuja líneas horizontales
    for (double i = 0; i <= size.height; i += gridSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    // Dibuja líneas verticales
    for (double i = 0; i <= size.width; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
