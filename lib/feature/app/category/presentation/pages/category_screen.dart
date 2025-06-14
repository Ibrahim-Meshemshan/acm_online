import 'package:acm_online/core/di/di.dart';
import 'package:acm_online/feature/app/category/presentation/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/utils/status.dart';

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
              print('Current state: ${state.categoryState}');
              print("length ${state.categoryList?.length}");
              if(state.categoryState == Status.loading){
                return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
              }else if (state.categoryState == Status.error) {
                print('category error: ${state.categoryError}');
                return Center(
                  child: Text(
                    "حدث خطأ: ${state.categoryState.toString()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }else if(state.categoryState == Status.success){
                return
              Expanded(
                child: ListView.builder(
                  itemCount: state.categoryList?.length,
                  itemBuilder: (context, index) {
                    print("length ${state.categoryList?.length}");
                    print('category Name: ${state.categoryList?[index].name}');
                  return Text(state.categoryList?[index].name ?? '',style: const TextStyle(color: Colors.white),);
                },),
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