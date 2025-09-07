class ResultsRequestModel {
  final int userId;
  final int categoryId;
  final int subcategoryId;
  final int score;

  ResultsRequestModel({required this.userId, required this.categoryId, required this.subcategoryId, required this.score});


  Map<String,dynamic> toJson(){
    return {
      'userId': userId,
      'categoryId': categoryId,
      'subcategoryId': subcategoryId,
      'score': score,
    };
  }
}

