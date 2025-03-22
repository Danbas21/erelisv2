import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/highlight.dart';

part 'highlight_model.freezed.dart';
part 'highlight_model.g.dart';

@freezed
sealed class HighlightModel with _$HighlightModel {
  const HighlightModel._();

  const factory HighlightModel({
    required String id,
    required String unitId,
    required String userId,
    required String text,
    required int startOffset,
    required int endOffset,
    required String colorHex,
  }) = _HighlightModel;

  factory HighlightModel.fromJson(Map<String, dynamic> json) =>
      _$HighlightModelFromJson(json);

  factory HighlightModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return HighlightModel.fromJson({
      'id': doc.id,
      ...data,
    });
  }

  Highlight toEntity() => Highlight(
        id: id,
        unitId: unitId,
        userId: userId,
        text: text,
        startOffset: startOffset,
        endOffset: endOffset,
        color: Color(int.parse(colorHex.substring(1), radix: 16) + 0xFF000000),
      );
}
