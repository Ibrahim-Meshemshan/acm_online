import 'package:acm_online/feature/app/quiz_level/domain/entities/level_question_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'level_quesiton_dto.g.dart';

@JsonSerializable()
class LevelQuestionDto {
  String? msg;
  List<QuestionDto>? data;

  LevelQuestionDto({this.msg, this.data});

  factory LevelQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$LevelQuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LevelQuestionDtoToJson(this);
}

@JsonSerializable()
class QuestionDto {
  List<String>? options;
  num? id;
  String? question;
  String? correctAnswer;
  String? difficulty;
  num? subCategoryId;

  QuestionDto({
    this.options,
    this.id,
    this.question,
    this.correctAnswer,
    this.difficulty,
    this.subCategoryId,
  });

  QuestionEntity toQuestionEntity() {
    return QuestionEntity(
      id: id,
      options: options,
      correctAnswer: correctAnswer,
      difficulty: difficulty,
      question: question,
      subCategoryId: subCategoryId,
    );
  }

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);
}
