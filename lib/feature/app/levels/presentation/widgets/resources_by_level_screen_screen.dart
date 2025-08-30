import 'package:acm_online/core/app_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/resources_response_model.dart';

class ResourcesByLevelScreen extends StatelessWidget {
  const ResourcesByLevelScreen({super.key, required this.resources});

  final List<ResourcesResponse>? resources;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.titleMedium?.copyWith(
      color: AppColors.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    final beginner = resources
        ?.where((r) => r.resourceLevel?.toLowerCase() == "beginner")
        .toList();
    final intermediate = resources
        ?.where((r) => r.resourceLevel?.toLowerCase() == "intermediate")
        .toList();
    final advanced = resources
        ?.where((r) => r.resourceLevel?.toLowerCase() == "advanced")
        .toList();

    Widget buildSection(String title, List<ResourcesResponse>? items) {
      if (items == null || items.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme),
          12.verticalSpace,
          ...items.map((res) => Card(
            color: AppColors.primaryColor.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                res.resourceName ?? '',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (res.resourceType != null)
                    Text(
                      "Type: ${res.resourceType}",
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 13,
                      ),
                    ),
                  if (res.resourceDescription != null &&
                      res.resourceDescription!.isNotEmpty)
                    Text(
                      res.resourceDescription!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
              trailing:
              const Icon(Icons.link, color: AppColors.primaryColor),
              onTap: () {
                if (res.resourceUrl != null &&
                    res.resourceUrl!.trim().isNotEmpty) {
                  launchUrl(Uri.parse(res.resourceUrl!));
                }
              },
            ),
          )),
          20.verticalSpace,
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildSection("Beginner Resources", beginner),
          buildSection("Intermediate Resources", intermediate),
          buildSection("Advanced Resources", advanced),
        ],
      ),
    );
  }
}
