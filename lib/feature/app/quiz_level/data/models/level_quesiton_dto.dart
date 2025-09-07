import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/level_question_entity.dart';

part 'level_quesiton_dto.g.dart';

@JsonSerializable()
class LevelQuestionDto {
  String? msg;
  List<QuestionResponse>? data;

  LevelQuestionDto({this.msg, this.data});

  factory LevelQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$LevelQuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LevelQuestionDtoToJson(this);
}

@JsonSerializable()
class QuestionResponse {
  List<String>? options;
  num? id;
  String? question;
  String? correctAnswer;
  String? difficulty;
  num? subCategoryId;

  QuestionResponse({
    this.options,
    this.id,
    this.question,
    this.correctAnswer,
    this.difficulty,
    this.subCategoryId,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);

  QuestionEntity toQuestionEntity() => QuestionEntity(
    id: id,
    options: options,
    correctAnswer: correctAnswer,
    difficulty: difficulty,
    question: question,
    subCategoryId: subCategoryId,
  );
}
