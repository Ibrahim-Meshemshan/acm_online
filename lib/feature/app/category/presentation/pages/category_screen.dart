import 'package:flutter/cupertino.dart';

import '../../../../../core/app_theme/app_theme.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("Category",style: AppTheme.lightTheme.textTheme.titleMedium,));
  }
}