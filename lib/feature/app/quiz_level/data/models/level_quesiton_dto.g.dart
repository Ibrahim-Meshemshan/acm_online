// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_quesiton_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelQuestionDto _$LevelQuestionDtoFromJson(Map<String, dynamic> json) =>
    LevelQuestionDto(
      msg: json['msg'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => QuestionDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$LevelQuestionDtoToJson(LevelQuestionDto instance) =>
    <String, dynamic>{'msg': instance.msg, 'data': instance.data};

QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) => QuestionDto(
  options:
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
  id: json['id'] as num?,
  question: json['question'] as String?,
  correctAnswer: json['correctAnswer'] as String?,
  difficulty: json['difficulty'] as String?,
  subCategoryId: json['subCategoryId'] as num?,
);

Map<String, dynamic> _$QuestionDtoToJson(QuestionDto instance) =>
    <String, dynamic>{
      'options': instance.options,
      'id': instance.id,
      'question': instance.question,
      'correctAnswer': instance.correctAnswer,
      'difficulty': instance.difficulty,
      'subCategoryId': instance.subCategoryId,
    };
