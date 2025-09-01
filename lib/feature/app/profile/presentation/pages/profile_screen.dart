import 'package:acm_online/core/app_colors/colors.dart';
import 'package:acm_online/core/widget/custom_app_bar.dart';
import 'package:acm_online/feature/app/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/status.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.profileState == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.profileState == Status.error) {
            return Center(child: Text(state.profileError ?? 'Error'));
          }
          if (state.profileState == Status.success) {
            final profile = state.profileList?.data;
            if (profile == null) {
              return const Center(child: Text("No Data Found"));
            }

            final avgScore = profile.quizCount > 0
                ? (profile.totalScore / profile.quizCount).toStringAsFixed(2)
                : "0.0";

            final joinDate = DateFormat.yMMMd().format(
              DateTime.parse(profile.joinedDate.toString()),
            );

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        child: Icon(Icons.person, size: 40),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${profile.firstName} ${profile.lastName}",
                              style:  const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(profile.email,
                                style: TextStyle(color: Colors.grey[600])),
                            Text("Joined: $joinDate",
                                style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  /// Stats Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard("Total Score", "${profile.totalScore}"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildInfoCard("Quizzes Taken", "${profile.quizCount}"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard("Average Score", "$avgScore%"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildInfoCard("Global Rank", "#${profile.globalRank}"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  /// Category Performance
                  const Text(
                    "Category Performance",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 16),

                  Column(
                    children: profile.userCategoriesScore.map((cat) {
                      final avg = cat.quizzesTaken > 0
                          ? (cat.subcategoryScore / cat.quizzesTaken).toStringAsFixed(1)
                          : cat.subcategoryScore.toString();

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: _buildCategoryProgress(
                          "${cat.categoryName} - ${cat.subcategoryName}",
                          double.tryParse(avg)!,
                          cat.quizzesTaken,
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 6),
            Text(value,
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryProgress(String title, double avgScore, int quizzes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColors.primaryColor)),
            Text("$avgScore%",
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColors.primaryColor)),
          ],
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: avgScore / 100,
          minHeight: 10,
          backgroundColor: Colors.grey[200],
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(6),
        ),
        const SizedBox(height: 4),
        Text("$quizzes quizzes taken",
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
