import 'package:flutter/cupertino.dart';

import '../../../../../core/app_theme/app_theme.dart';

class LeaderBordScreen extends StatelessWidget {
  const LeaderBordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("LeaderBoard",style: AppTheme.lightTheme.textTheme.titleMedium));
  }
}