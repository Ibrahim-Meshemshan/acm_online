import 'package:acm_online/core/app_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/model/resources_response_model.dart';

class ResourcesByLevelScreen extends StatelessWidget {
  const ResourcesByLevelScreen({super.key, required this.resources});

  final List<ResourcesResponse>? resources;

  IconData _getIcon(String? type) {
    switch (type?.toLowerCase()) {
      case "book":
        return Icons.menu_book_rounded;
      case "video":
        return Icons.play_circle_fill_rounded;
      case "article":
        return Icons.article_rounded;
      case "course":
        return Icons.school_rounded;
      default:
        return Icons.folder_rounded;
    }
  }

  Color _getLevelColor(String? level) {
    switch (level?.toLowerCase()) {
      case "beginner":
        return AppColors.beginnerColor;
      case "intermediate":
        return AppColors.intermediateColor;
      case "advanced":
        return AppColors.whiteColor;
      default:
        return AppColors.primaryColor;
    }
  }

  Widget _buildSection(String title, List<ResourcesResponse>? items) {
    if (items == null || items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              color: _getLevelColor(title),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...items.map((res) {
          final levelColor = _getLevelColor(res.resourceLevel);
          return Card(
            color: AppColors.cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: levelColor.withOpacity(0.4), width: 1),
            ),
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: levelColor.withOpacity(0.15),
                child: Icon(
                  _getIcon(res.resourceType),
                  color: levelColor,
                  size: 28,
                ),
              ),
              title: Text(
                res.resourceName ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              subtitle: res.resourceDescription?.isNotEmpty == true
                  ? Text(
                res.resourceDescription!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 13,
                ),
              )
                  : null,
              trailing: IconButton(
                icon: Icon(Icons.open_in_new, color: levelColor),
                onPressed: () {
                  if (res.resourceUrl != null &&
                      res.resourceUrl!.trim().isNotEmpty) {
                    launchUrl(Uri.parse(res.resourceUrl!));
                  }
                },
              ),
            ),
          );
        }).toList(),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final beginner = resources
        ?.where((r) => r.resourceLevel?.toLowerCase() == "beginner")
        .toList();
    final intermediate = resources
        ?.where((r) => r.resourceLevel?.toLowerCase() == "intermediate")
        .toList();
    final advanced = resources
        ?.where((r) => r.resourceLevel?.toLowerCase() == "advanced")
        .toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection("📘 Beginner Resources", beginner),
          _buildSection("📗 Intermediate Resources", intermediate),
          _buildSection("📕 Advanced Resources", advanced),
        ],
      ),
    );
  }
}
