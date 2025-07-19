import 'package:acm_online/feature/app/resources/domain/entities/resources_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utils/status.dart';
import '../../../quiz_level/presentation/cubit/level_question_cubit.dart';
import '../widgets/resources_card.dart';

class ResourcesScreen extends StatelessWidget {
  final String? level;

  const ResourcesScreen({super.key, this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resources Level ${_getLocalizedLevel(level ?? 'advanced')}',
          style: const TextStyle(color: AppColors.whiteColor,fontSize: 18),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.blackColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Through these resources you can learn your current level and take the test upon completion of your studies.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BlocProvider(
                create: (context) =>
                getIt<LevelQuestionCubit>()..fetchResources(level ?? 'advanced'),
                child: BlocConsumer<LevelQuestionCubit, LevelQuestionState>(
                  listener: (context, state) {
                    if (state.resourcesState == Status.error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('حدث خطأ: ${state.resourcesError}'),
                          backgroundColor: AppColors.errorColor,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.resourcesState == Status.loading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }

                    if (state.resourcesState == Status.error) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 48,
                              color: AppColors.errorColor,
                            ),
                            const SizedBox(height: 16),
                            const Text('فشل تحميل الموارد'),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => context
                                  .read<LevelQuestionCubit>()
                                  .fetchResources(level ?? 'advanced'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                              ),
                              child: const Text(
                                'إعادة المحاولة',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: state.resourcesList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final resource = state.resourcesList![index];
                        return ResourcesCard(resource: resource);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }





  String _getLocalizedLevel(String level) {
    switch (level.toLowerCase()) {
      case 'beginner':
        return 'beginner';
      case 'intermediate':
        return 'intermediate';
      case 'advanced':
        return 'advanced';
      default:
        return level;
    }
  }

  // String _getImageForResourceType(String? type) {
  //   switch (type?.toLowerCase()) {
  //     case 'book':
  //       return 'assets/images/book.png';
  //     case 'video':
  //       return 'assets/images/video.png';
  //     case 'article':
  //       return 'assets/images/article.png';
  //     case 'course':
  //       return 'assets/images/course.png';
  //     default:
  //       return 'assets/images/resource.png';
  //   }
  // }
}