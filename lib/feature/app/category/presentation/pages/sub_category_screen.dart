import 'package:acm_online/core/di/di.dart';
import 'package:acm_online/core/widget/custom_app_bar.dart';
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
      appBar: CustomAppBar(title: 'Quiz Sub Category'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Your Quiz',
              style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            BlocProvider(
              create: (context) =>
              getIt<SubCategoryCubit>()..getSubCategory(),
              child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
                builder: (context, state) {
                  if (state.subCategoryState == Status.loading) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    );
                  } else if (state.subCategoryState == Status.error) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          "حدث خطأ: ${state.subCategoryState.toString()}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  } else if (state.subCategoryState == Status.success) {
                    final subCategories = state.subCategoryList?.data ?? [];

                    return Expanded(
                      child: ListView.separated(
                        itemCount: subCategories.length,
                        separatorBuilder: (_, __) =>
                        const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final sub = subCategories[index];
                          return Card(
                            color: AppColors.cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 3,
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              leading: CircleAvatar(
                                backgroundColor:
                                AppColors.primaryColor.withOpacity(0.2),
                                child: const Icon(
                                  FontAwesomeIcons.brain,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              title: Text(
                                sub.name ?? '',
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.primaryColor,
                                size: 18,
                              ),
                              onTap: () {
                                // هنا ضع التنقل للشاشة التالية
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
            ),
          ],
        ),
      ),
    );
  }
}
