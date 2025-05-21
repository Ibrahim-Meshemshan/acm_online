import 'package:flutter/cupertino.dart';

import '../../../../../core/app_theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("Profile",style: AppTheme.lightTheme.textTheme.titleMedium));
  }
}