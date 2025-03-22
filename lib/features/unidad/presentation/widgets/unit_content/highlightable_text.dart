// lib/presentation/widgets/unit_content/highlightable_text.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain/entities/highlight.dart';

class HighlightableText extends StatefulWidget {
  final String text;
  final List<Highlight> highlights;
  final Function(String text, int start, int end) onHighlightSelected;

  const HighlightableText({
    super.key,
    required this.text,
    required this.highlights,
    required this.onHighlightSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HighlightableTextState createState() => _HighlightableTextState();
}

class _HighlightableTextState extends State<HighlightableText> {
  @override
  Widget build(BuildContext context) {
    // Construir RichText con spans para el texto resaltado
    return SelectableText.rich(
      TextSpan(
        children: _buildTextSpans(),
        style: GoogleFonts.kalam(
          textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
      ),
      onSelectionChanged: (selection, cause) {
        if (selection.isValid &&
            selection.baseOffset != selection.extentOffset) {
          widget.onHighlightSelected(
            widget.text.substring(selection.baseOffset, selection.extentOffset),
            selection.baseOffset,
            selection.extentOffset,
          );
        }
      },
    );
  }

  List<TextSpan> _buildTextSpans() {
    // Si no hay highlights, devolver el texto completo
    if (widget.highlights.isEmpty) {
      return [TextSpan(text: widget.text)];
    }

    // Ordenar highlights por posición
    final sortedHighlights = List<Highlight>.from(widget.highlights)
      ..sort((a, b) => a.startOffset.compareTo(b.startOffset));

    final List<TextSpan> spans = [];
    int currentPosition = 0;

    // Crear spans para el texto, aplicando highlights
    for (final highlight in sortedHighlights) {
      // Añadir texto antes del highlight
      if (highlight.startOffset > currentPosition) {
        spans.add(TextSpan(
          text: widget.text.substring(currentPosition, highlight.startOffset),
        ));
      }

      // Añadir texto con highlight
      spans.add(TextSpan(
        text: widget.text.substring(highlight.startOffset, highlight.endOffset),
        style: TextStyle(
          backgroundColor: highlight.color.withValues(alpha: (0.3)),
        ),
      ));

      currentPosition = highlight.endOffset;
    }

    // Añadir texto final después del último highlight
    if (currentPosition < widget.text.length) {
      spans.add(TextSpan(
        text: widget.text.substring(currentPosition),
      ));
    }

    return spans;
  }
}
