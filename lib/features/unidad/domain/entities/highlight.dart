// lib/domain/entities/highlight.dart
import 'dart:ui';

class Highlight {
  final String id;
  final String unitId;
  final String userId;
  final String text;
  final int startOffset;
  final int endOffset;
  final Color color;

  Highlight({
    required this.id,
    required this.unitId,
    required this.userId,
    required this.text,
    required this.startOffset,
    required this.endOffset,
    required this.color,
  });
}
