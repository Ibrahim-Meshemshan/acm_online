

class LevelQuestionEntity {
  String? msg;
  List<QuestionEntity>? data;

  LevelQuestionEntity({this.msg, this.data});


}

class QuestionEntity {
  List<String>? options;
  num? id;
  String? question;
  String? correctAnswer;
  String? difficulty;
  num? subCategoryId;

  QuestionEntity({this.options, this.id, this.question, this.correctAnswer, this.difficulty, this.subCategoryId});


}

