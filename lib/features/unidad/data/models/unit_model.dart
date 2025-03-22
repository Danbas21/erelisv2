// data/models/unit_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/unit.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

@freezed
sealed class UnitModel with _$UnitModel {
  const UnitModel._();

  const factory UnitModel({
    required String id,
    required String title,
    required String content,
    @Default(false) bool isCompleted,
    required String courseId,
    required DateTime lastVisited,
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);

  factory UnitModel.fromFirestore(
      Map<String, dynamic> firestoreData, String docId) {
    return UnitModel(
      id: docId,
      title: firestoreData['title'] ?? '',
      content: firestoreData['content'] ?? '',
      isCompleted: firestoreData['isCompleted'] ?? false,
      courseId: firestoreData['courseId'] ?? '',
      lastVisited: firestoreData['lastVisited'] != null
          ? (firestoreData['lastVisited'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Unit toEntity() {
    print("Convirtiendo UnitModel a Unit: $id, $title");
    return Unit(
      id: id,
      title: title,
      content: content,
      isCompleted: isCompleted,
      courseId: courseId,
      lastVisited: lastVisited,
    );
  }
}
