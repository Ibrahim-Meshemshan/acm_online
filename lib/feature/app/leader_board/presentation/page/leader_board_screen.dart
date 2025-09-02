import 'package:acm_online/core/app_colors/colors.dart';
import 'package:acm_online/core/widget/custom_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/utils/status.dart';
import '../cubit/leader_cubit.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

  IconData _getTrophyIcon(int index) {
    switch (index) {
      case 0:
        return FontAwesomeIcons.trophy;
      case 1:
        return FontAwesomeIcons.medal;
      case 2:
        return FontAwesomeIcons.medal;
      default:
        return FontAwesomeIcons.award;
    }
  }

  Color _getTrophyColor(int index) {
    switch (index) {
      case 0:
        return Colors.amber;
      case 1:
        return Colors.grey;
      case 2:
        return Colors.brown;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Leader Board'),
      body: BlocProvider(
        create: (context) => getIt<LeaderCubit>()..getLeaderScore(),
        child: BlocBuilder<LeaderCubit, LeaderState>(
          builder: (context, state) {
            if (state.leaderState == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.leaderState == Status.error) {
              return Center(
                child: Text(state.leaderError ?? "Error loading leaderboard"),
              );
            }

            final users = state.leaderList?.data.userScores ?? [];
            if (users.isEmpty) {
              return const Center(child: Text("No data available"));
            }

            final top3 = users.take(3).toList();
            final others = users.skip(3).toList();

            return SingleChildScrollView(
              child: Column(
                children: [
                  if (top3.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: CarouselSlider.builder(
                        itemCount: top3.length,
                        options: CarouselOptions(
                          height: 270,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          viewportFraction: 1,
                        ),
                        itemBuilder: (context, index, realIndex) {
                          final user = top3[index];
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _getTrophyIcon(index),
                                  color: _getTrophyColor(index),
                                  size: 60,
                                ),
                                const SizedBox(height: 12),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: AppColors.primaryColor,
                                  child: Text(
                                    "${index + 1}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "${user.firstName} ${user.lastName}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Score: ${user.totalScore}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                  // List for others
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: others.length,
                    itemBuilder: (context, index) {
                      final user = others[index];
                      final rank = index + 4;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                          AppColors.primaryColor.withOpacity(0.5),
                          child: Text(
                            "$rank",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text(
                          "${user.firstName} ${user.lastName}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "Score: ${user.totalScore} | Quizzes: ${user.quizCount}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: Text(
                          "${user.totalScore}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondPrimaryColor,
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
