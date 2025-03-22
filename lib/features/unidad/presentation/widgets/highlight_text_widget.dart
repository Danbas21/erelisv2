// presentation/widgets/highlight_text_widget.dart
import 'package:erelis/features/unidad/presentation/blocs/unit_detail/unit_detail_bloc.dart';
import 'package:flutter/material.dart';

class HighlightTextWidget extends StatelessWidget {
  final String text;
  final List<HighlightData> highlights;
  final TextStyle style;

  const HighlightTextWidget({
    super.key,
    required this.text,
    required this.highlights,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    // Si no hay resaltados, mostramos el texto normal
    if (highlights.isEmpty) {
      return Text(text, style: style);
    }

    // Preparamos los spans para construir el texto con resaltados
    final List<TextSpan> spans = [];

    // Recorremos el texto para aplicar los resaltados
    String remainingText = text;

    for (final highlight in highlights) {
      final highlightStart = remainingText.indexOf(highlight.text);

      if (highlightStart >= 0) {
        // Texto antes del resaltado
        if (highlightStart > 0) {
          spans.add(TextSpan(
            text: remainingText.substring(0, highlightStart),
            style: style,
          ));
        }

        // Texto resaltado
        spans.add(TextSpan(
          text: highlight.text,
          style: style.copyWith(
            backgroundColor: _getHighlightColor(highlight.color),
          ),
        ));

        // Actualizamos el texto restante
        remainingText = remainingText.substring(
          highlightStart + highlight.text.length,
        );
      }
    }

    // Agregamos el texto restante si queda algo
    if (remainingText.isNotEmpty) {
      spans.add(TextSpan(
        text: remainingText,
        style: style,
      ));
    }

    return RichText(
      text: TextSpan(
        children: spans,
      ),
    );
  }

  Color _getHighlightColor(String color) {
    switch (color.toLowerCase()) {
      case 'naranja':
        return Colors.orange.withOpacity(0.3);
      case 'verde':
        return Colors.green.withOpacity(0.3);
      case 'amarillo':
        return Colors.yellow.withOpacity(0.3);
      default:
        return Colors.yellow.withOpacity(0.3);
    }
  }
}
