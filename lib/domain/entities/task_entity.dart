import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entity.freezed.dart';
part 'task_entity.g.dart';

@freezed
sealed class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required String id,
    required String name,
    required String page,
    required String dueTime,
    @Default(false) bool isCompleted,
  }) = _TaskEntity;

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);
}
