import 'package:acm_online/core/di/di.dart';
import 'package:acm_online/feature/app/category/presentation/cubit/sub_category/sub_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/utils/status.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          FontAwesomeIcons.brain,
          color: AppColors.primaryColor,
        ),
        title: const Text('Quiz Sub Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Your Quiz',
              style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            BlocProvider(
              create:
                  (context) => getIt<SubCategoryCubit>()..getSubCategory(),
              child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
                builder: (context, state) {
                  if (state.subCategoryState == Status.loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (state.subCategoryState == Status.error) {
                    return Center(
                      child: Text(
                        "حدث خطأ: ${state.subCategoryState.toString()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (state.subCategoryState == Status.success) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        border: Border.all(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            'Select Category',
                            style: AppTheme.lightTheme.textTheme.titleMedium
                                ?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: 18,
                                ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Choose a category for your quiz questions',
                            style: AppTheme.lightTheme.textTheme.titleMedium
                                ?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: 14,
                                ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: GridView.builder(
                              itemCount: state.subCategoryList?.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                              padding: const EdgeInsets.all(10),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          //
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.1,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Text(
                                            state.subCategoryList?.data[index].name ?? '',
                                            style: AppTheme.lightTheme.textTheme.titleMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox(
                    height: 10,
                    child: Text(
                      'Sized Box',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
