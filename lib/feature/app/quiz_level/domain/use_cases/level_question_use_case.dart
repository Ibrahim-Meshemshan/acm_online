import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/app/quiz_level/domain/entities/level_question_entity.dart';
import 'package:acm_online/feature/app/quiz_level/domain/repositories/level_question_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LevelQuestionUseCase {
  final LevelQuestionRepo _repo;
  LevelQuestionUseCase(this._repo);

  Future<ApiResult<List<QuestionEntity>>> call()async{
    return await _repo.fetchLevelQuestion();
  }
}