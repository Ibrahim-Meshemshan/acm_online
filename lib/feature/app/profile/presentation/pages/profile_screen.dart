import 'package:acm_online/core/app_colors/colors.dart';
import 'package:acm_online/core/storage/sharedprefrencec_helper.dart';
import 'package:acm_online/core/widget/custom_app_bar.dart';
import 'package:acm_online/feature/app/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/utils/status.dart';
import '../../../../auth/presentation/cubit/auth_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: BlocBuilder<ProfileCubit, ProfileState>(
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

              final avgScore =
                  profile.quizCount > 0
                      ? (profile.totalScore / profile.quizCount)
                          .toStringAsFixed(2)
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
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${profile.firstName} ${profile.lastName}",
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontFamily: 'Cairo',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                profile.email,
                                style: TextStyle(color: Colors.grey[600],fontFamily: 'Cairo',),
                              ),
                              Text(
                                "Joined: $joinDate",
                                style: TextStyle(color: Colors.grey[600],fontFamily: 'Cairo',),
                              ),
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
                          child: _buildInfoCard(
                            "Total Score",
                            "${profile.totalScore}",
                            Icons.star,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildInfoCard(
                            "Quizzes Taken",
                            "${profile.quizCount}",
                            Icons.assignment,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            "Average Score",
                            "$avgScore%",
                            Icons.leaderboard,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildInfoCard(
                            "Global Rank",
                            "#${profile.globalRank}",
                            Icons.emoji_events,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    /// Category Performance
                    const Text(
                      "Category Performance",
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Column(
                      children:
                          profile.userCategoriesScore.map((cat) {
                            final avg =
                                cat.quizzesTaken > 0
                                    ? (cat.subcategoryScore / cat.quizzesTaken)
                                        .toStringAsFixed(1)
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
                    ),

                    const SizedBox(height: 32),

                    /// Logout Button
                    Card(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: AppColors.whiteColor,
                        ),
                        title: const Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder:
                                (ctx) => AlertDialog(
                                  backgroundColor: AppColors.backgroundColor,
                                  title: const Text(
                                    "Logout",
                                    style: TextStyle(color: Colors.white,fontFamily: 'Cairo',),
                                  ),
                                  content: const Text(
                                    "Are you sure you want to logout?",
                                    style: TextStyle(color: Colors.white,fontFamily: 'Cairo',),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text(
                                        "No",
                                        style: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.backgroundColor,
                                      ),
                                      onPressed: () async {
                                       Navigator.pop(context);

                                        final refreshToken =
                                            SharedPreferencesHelper.getRefreshToken()!;
                                        await context.read<AuthCubit>().logout(
                                          refreshToken,
                                        );
                                        SystemNavigator.pop();
                                      },
                                      child: const Text(
                                        "Logout",
                                        style: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: AppColors.errorColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Card(
      color: AppColors.primaryColor.withOpacity(0.08),
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: AppColors.primaryColor),
                const SizedBox(width: 6),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 14,fontFamily: 'Cairo',),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
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
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            Text(
              "$avgScore%",
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: avgScore / 100,
          minHeight: 10,
          backgroundColor: Colors.grey[200],
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        const SizedBox(height: 4),
        Text(
          "$quizzes quizzes taken",
          style: const TextStyle(fontSize: 12, color: Colors.grey,fontFamily: 'Cairo'),
        ),
      ],
    );
  }
}
