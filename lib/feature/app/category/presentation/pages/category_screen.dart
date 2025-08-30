import 'package:acm_online/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/routes_manager/routes_names.dart';
import '../../../../../core/utils/status.dart';
import '../cubit/category/category_cubit.dart';
import '../cubit/category/category_state.dart';
import '../widgets/quiz_category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          FontAwesomeIcons.brain, color: AppColors.primaryColor,),
        title: const Text('Quiz Category'),),
      body: Padding(padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              'Choose from a variety of categories to test your knowledge and challenge yourself with AI-generated questions',
              style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                  fontSize: 18
              ),),
            const SizedBox(height: 50),

            BlocProvider(create: (context) => getIt<CategoryCubit>()..fetchCategory(),
            child: BlocBuilder<CategoryCubit,CategoryState>(builder: (context, state) {
              print("state is:${state.categoryState}");
              if(state.categoryState == Status.loading){
                return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
              }else if (state.categoryState == Status.error) {
                return Center(
                  child: Text(
                    "حدث خطأ: ${state.categoryState.toString()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }else if (state.categoryState == Status.success) {

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: state.categoryList?.data.length,
                      itemBuilder: (context, index) {
                        final category = state.categoryList?.data[index];
                        if (category == null) {
                          return const SizedBox.shrink(); // Handle null category gracefully
                        }
                        return Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: QuizCategoryCard(
                            title: category.name ?? '',
                            questionCount: "${category.questionCount.toString()} Question" ??  '${(index + 1) * 100}+ Questions', // Placeholder
                            onStartQuizPressed: () {
                              Navigator.pushNamed(context, RoutesNames.subCategory);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              }return const SizedBox();
            },),
            )
          ],
        ),
      ),
    );
  }
}