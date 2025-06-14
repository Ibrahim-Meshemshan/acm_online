import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/app/quiz_level/data/data_sources/level_question_data_source.dart';

import 'package:acm_online/feature/app/quiz_level/domain/entities/level_question_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/level_question_repo.dart';


@Injectable(as: LevelQuestionRepo)
class LevelQuestionRepoImpl implements  LevelQuestionRepo {
 final LevelQuestionDataSource _dataSource;
  LevelQuestionRepoImpl(this._dataSource);
  @override
  Future<ApiResult<List<QuestionEntity>>> fetchLevelQuestion() {
    return _dataSource.fetchLevelQuestion();
  }

}