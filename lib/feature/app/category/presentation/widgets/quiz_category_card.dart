import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_colors/colors.dart';

class QuizCategoryCard extends StatelessWidget {
  final String title;
  final String questionCount;
  final VoidCallback onStartQuizPressed;

  const QuizCategoryCard({
    super.key,
    required this.title,
    required this.questionCount,
    required this.onStartQuizPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.3,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      questionCount,
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8.0),
                    Text(
                      title,

                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [

                const SizedBox(height: 70),
                SizedBox(
                  width: double.infinity, // Make button fill width
                  child: ElevatedButton(
                    onPressed: onStartQuizPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor, // Button background
                      foregroundColor: AppColors.primaryColor, // Text color
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Start Quiz',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}