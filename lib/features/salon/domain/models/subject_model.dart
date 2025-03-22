import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_model.freezed.dart';
part 'subject_model.g.dart';

@freezed
sealed class SubjectModel with _$SubjectModel {
  factory SubjectModel({
    required String id,
    required String title,
    required String imageUrl,
    @Default(false) bool isEnabled,
  }) = _SubjectModel;

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
}
