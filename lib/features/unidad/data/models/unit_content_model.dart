// lib/features/unidad/data/models/unit_content_model.dart
import 'package:erelis/features/unidad/domain/entities/unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/unit_content.dart';

part 'unit_content_model.freezed.dart';
part 'unit_content_model.g.dart';

@freezed
sealed class UnitContentModel with _$UnitContentModel {
  const UnitContentModel._();

  const factory UnitContentModel({
    required String id,
    required String unitId,
    required String title,
    required String text,
    List<String>? tags,
  }) = _UnitContentModel;

  factory UnitContentModel.fromJson(Map<String, dynamic> json) =>
      _$UnitContentModelFromJson(json);

  factory UnitContentModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UnitContentModel.fromJson({
      'id': doc.id,
      ...data,
    });
  }

  // También podemos construir el contenido directamente desde la unidad
  factory UnitContentModel.fromUnit(Unit unit) {
    return UnitContentModel(
      id: unit.id,
      unitId: unit.id,
      title: unit.title,
      text: unit.content,
      tags: [],
    );
  }

  UnitContent toEntity() => UnitContent(
      id: id,
      unitId: unitId,
      title: title,
      text: text,
      tags: tags ?? [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());
}
