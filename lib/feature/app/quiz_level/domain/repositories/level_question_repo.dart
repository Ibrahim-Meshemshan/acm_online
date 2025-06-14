import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/app/quiz_level/domain/entities/level_question_entity.dart';

abstract class LevelQuestionRepo {
  Future<ApiResult<List<QuestionEntity>>> fetchLevelQuestion();
}