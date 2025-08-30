import 'package:acm_online/core/app_theme/app_theme.dart';
import 'package:acm_online/core/di/di.dart';
import 'package:acm_online/feature/app/levels/presentation/cubit/resources_cubit.dart';
import 'package:acm_online/feature/app/quiz_level/presentation/cubit/level_question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/utils/dialog_utils.dart';
import '../../../../../core/utils/status.dart';
import '../../../../../core/widget/custom_app_bar.dart';
import '../../../levels/presentation/pages/resources_screen.dart';

class QuizLevelScreen extends StatelessWidget {
  const QuizLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LevelQuestionCubit>()..fetchLevelQuestion(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<LevelQuestionCubit>();

          return Scaffold(
            appBar: CustomAppBar(title: 'Question Screen',icon: const Icon(Icons.arrow_back),),
            body: BlocConsumer<LevelQuestionCubit, LevelQuestionState>(
              listener: (context, state) {
                if (state.levelQuestionState == Status.completed) {
                  final score = state.finalScore;
                  final userLevel = _getUserLevel(score);
                  final levelColor = _getLevelColor(userLevel);
                  final levelText = _getLocalizedLevel(userLevel.toLowerCase());
                  DialogUtils.showMessage(
                    context,
                    "Your score: ${score.toStringAsFixed(2)}%\n\nYour level: ${_getLocalizedLevel(userLevel)}",
                    posActionName: "Move to study level",
                    isError: score <= 33.33,
                    posAction: () {
                      DialogUtils.hideLoading(context);
                      // final englishLevel = _getUserLevel(score).toLowerCase();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResourcesScreen(),
                        ),
                      );

                    },
                  );
                }
              },

              builder: (context, state) {
                if (state.levelQuestionState == Status.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.levelQuestionState == Status.error) {
                  return Center(
                    child: Text(
                      "حدث خطأ: ${state.levelQuestionError?.toString()}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                } else if (state.levelQuestionList == null ||
                    state.levelQuestionList!.isEmpty) {
                  return const Center(child: Text("لا توجد أسئلة متاحة."));
                }

                final question = state.levelQuestionList![cubit.currentIndex];

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Question ${cubit.currentIndex + 1} of ${state.levelQuestionList!.length}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: cubit.timeLeft / 30,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppTheme.lightTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder:
                            (child, animation) => FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                        child: Text(
                          question.question ?? "السؤال غير متاح",
                          key: ValueKey<int>(cubit.currentIndex),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child:
                            question.options == null ||
                                    question.options!.isEmpty
                                ? const Center(
                                  child: Text("لا توجد خيارات لهذا السؤال."),
                                )
                                : ListView.builder(
                                  itemCount: question.options!.length,
                                  itemBuilder: (context, index) {
                                    final isSelected =
                                        cubit.selectedAnswer == index;
                                    final isCorrectAnswer =
                                        question.options?[index] ==
                                        question.correctAnswer;
                                    final showFeedback =
                                        cubit.showFeedback && isSelected;

                                    return AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            isSelected
                                                ? (showFeedback
                                                    ? (isCorrectAnswer
                                                        ? Colors.green
                                                            .withOpacity(0.8)
                                                        : Colors.red
                                                            .withOpacity(0.8))
                                                    : AppColors
                                                        .secondPrimaryColor
                                                        .withOpacity(0.8))
                                                : (cubit.showFeedback &&
                                                        isCorrectAnswer
                                                    ? Colors.green.withOpacity(
                                                      0.3,
                                                    )
                                                    : Colors.white),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: RadioListTile<int>(
                                        title: Text(
                                          question.options?[index] ??
                                              "خيار غير متاح",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                isSelected
                                                    ? (showFeedback
                                                        ? (isCorrectAnswer
                                                            ? Colors.green
                                                            : Colors.red)
                                                        : Colors.black)
                                                    : (cubit.showFeedback &&
                                                            isCorrectAnswer
                                                        ? Colors.green
                                                        : Colors.black),
                                          ),
                                        ),
                                        value: index,
                                        groupValue: cubit.selectedAnswer,
                                        onChanged:
                                            cubit.showFeedback
                                                ? null // تعطيل التغيير عند عرض النتيجة
                                                : (int? value) {
                                                  if (value != null) {
                                                    cubit.selectAnswer(value);
                                                  }
                                                },
                                      ),
                                    );
                                  },
                                ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondPrimaryColor,
                                foregroundColor: AppColors.whiteColor,
                              ),
                              onPressed:
                                  cubit.currentIndex > 0
                                      ? cubit.previousQuestion
                                      : null,
                              child: const Text(
                                "Back",
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ElevatedButton(
                              onPressed:
                                  cubit.selectedAnswer != -1
                                      ? cubit.nextQuestion
                                      : null,
                              child: const Text(
                                "Next",
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
String _getUserLevel(double score) {
  if (score <= 33.33) {
    return "Beginner";
  } else if (score <= 66.66) {
    return "Intermediate";
  } else {
    return "Advanced";
  }
}
String _getLocalizedLevel(String level) {
  switch (level.toLowerCase()) {
    case "beginner": return "beginner";
    case "intermediate": return "intermediate";
    case "advanced": return "advanced";
    default: return level;
  }
}
Color _getLevelColor(String level) {
  switch (level) {
    case "Beginner":
      return Colors.red;
    case "Intermediate":
      return Colors.orange;
    case "Advanced":
      return Colors.green;
    default:
      return Colors.black;
  }
}