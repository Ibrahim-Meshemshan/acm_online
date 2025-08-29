import 'package:acm_online/core/app_colors/colors.dart';
import 'package:acm_online/core/app_theme/app_theme.dart';
import 'package:acm_online/core/routes_manager/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/widget/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: CustomAppBar(title: 'Quizly',icon: const Icon(FontAwesomeIcons.brain),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                style: AppTheme.lightTheme.textTheme.titleLarge,
                children: const [
                  TextSpan(text: 'Master Programming with '),
                  TextSpan(
                    text: 'AI-Powered',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  TextSpan(text: ' Quizzes'),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Quizly generates fresh, challenging questions across various programming languages,'
              ' adapting to your skill level for a personalized learning experience.',
              style: AppTheme.lightTheme.textTheme.titleMedium,
            ),
            const SizedBox(height: 100),
            Row(
              spacing: 30,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesNames.quizScreen);
                    },
                    child: Text('Start Coding Quiz',style: AppTheme.lightTheme.textTheme.titleMedium,),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
