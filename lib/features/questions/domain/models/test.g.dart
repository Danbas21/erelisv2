// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Test _$TestFromJson(Map<String, dynamic> json) => _Test(
      id: json['id'] as String,
      title: json['title'] as String,
      courseId: json['courseId'] as String,
      unitId: json['unitId'] as String,
      questionCount: (json['questionCount'] as num).toInt(),
      timeLimit: (json['timeLimit'] as num?)?.toInt() ?? 30,
      description: json['description'] as String? ?? '',
      hasAttempted: json['hasAttempted'] as bool? ?? false,
      isPassed: json['isPassed'] as bool? ?? false,
      lastScore: (json['lastScore'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$TestToJson(_Test instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'courseId': instance.courseId,
      'unitId': instance.unitId,
      'questionCount': instance.questionCount,
      'timeLimit': instance.timeLimit,
      'description': instance.description,
      'hasAttempted': instance.hasAttempted,
      'isPassed': instance.isPassed,
      'lastScore': instance.lastScore,
    };
