import 'package:acm_online/core/di/di.dart';
import 'package:acm_online/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/routes_manager/routes_names.dart';
import '../../../../../core/utils/status.dart';
import '../cubit/category/category_cubit.dart';
import '../cubit/category/category_state.dart';
import '../pages/sub_category_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryCubit>()..fetchCategory(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Quiz Category'),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                'Pick a category and start challenging yourself with AI-generated quizzes!',
                style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state.categoryState == Status.loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (state.categoryState == Status.error) {
                    return Center(
                      child: Text(
                        "حدث خطأ: ${state.categoryError ?? "خطأ غير معروف"}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state.categoryState == Status.success) {
                    final categories = state.categoryList?.data ?? [];

                    return Expanded(
                      child: ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return Card(
                            color: AppColors.cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: const Icon(
                                Icons.category,
                                color: AppColors.primaryColor,
                                size: 32,
                              ),
                              title: Text(
                                category.name ?? '',
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "${category.questionCount ?? 0} Questions",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: Colors.grey,
                              ),
                              onTap: () {
                                context.read<CategoryCubit>().fetchSubCategory(category.id);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider.value(
                                      value: context.read<CategoryCubit>(),
                                      child: const SubCategoryScreen(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
