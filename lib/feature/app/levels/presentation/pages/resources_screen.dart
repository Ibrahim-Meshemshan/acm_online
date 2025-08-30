import 'package:acm_online/core/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/app_colors/colors.dart';
import '../cubit/resources_cubit.dart';
import '../widgets/resources_by_level_screen_screen.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {


  @override
  void initState() {
    super.initState();
    context.read<ResourcesCubit>().getResources();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resources",
          style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: AppColors.backgroundColor,
        elevation: 0,

      ),
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<ResourcesCubit, ResourcesState>(
        builder: (context, state) {
          if (state.resourcesState == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.resourcesState == Status.error) {
            return Center(child: Text(state.resourcesError ?? ''));
          }

          if (state.resourcesState == Status.success) {
            return ResourcesByLevelScreen(resources: state.resourcesList?.data);          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

}
