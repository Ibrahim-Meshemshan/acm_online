import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/routes_manager/routes_names.dart';
// Import the separate LevelCard widget
import '../widgets/level_card.dart';

// The LevelsScreen must be a StatefulWidget to manage the lock state
class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  bool _isBeginnerLevelPassed = false; // State to track if the Beginner level has been passed

  @override
  void initState() {
    super.initState();
    _checkBeginnerLevelStatus();
  }

  // Function to check the Beginner level pass status from SharedPreferences
  Future<void> _checkBeginnerLevelStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isBeginnerLevelPassed = prefs.getBool('isBeginnerLevelPassed') ?? false;
    });
  }

  // Function to update and save the Beginner level pass status
  Future<void> _setBeginnerLevelPassed(bool passed) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isBeginnerLevelPassed', passed);
    setState(() {
      _isBeginnerLevelPassed = passed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Levels",
          style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Beginner Level Card - Always available
            LevelCard(
              levelName: 'Beginner',
              description: 'Start your educational journey from scratch and learn the basics.',
              icon: Icons.school,
              iconColor: Colors.green,
              isEnabled: true, // Beginner level is always enabled
              onTap: () async {
                // When tapping the Beginner level, navigate to the level details page
                // or to the initial test page if you want
                final result = await Navigator.pushNamed(
                  context,
                  RoutesNames.levelDetails, // Assume this leads to a level details screen or a test
                  arguments: 'Beginner',
                );

                // Example: If the details/test page returns true upon success
                if (result == true) {
                  _setBeginnerLevelPassed(true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Congratulations! You have passed the Beginner level. Other levels are now unlocked.')),
                  );
                }
              },
            ),
            20.verticalSpace,
            // Intermediate Level Card - Available only if Beginner is passed
            LevelCard(
              levelName: 'Intermediate',
              description: 'Enhance your knowledge and skills with more advanced topics.',
              icon: Icons.trending_up,
              iconColor: Colors.orange,
              isEnabled: _isBeginnerLevelPassed, // Depends on the Beginner level pass status
              onTap: () {
                if (_isBeginnerLevelPassed) {
                  Navigator.pushNamed(
                    context,
                    RoutesNames.levelDetails,
                    arguments: 'Intermediate',
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please pass the Beginner level first to unlock this level.')),
                  );
                }
              },
            ),
            20.verticalSpace,
            // Advanced Level Card - Available only if Beginner is passed
            LevelCard(
              levelName: 'Advanced',
              description: 'Delve into specialized areas and become an expert.',
              icon: Icons.star,
              iconColor: Colors.red,
              isEnabled: _isBeginnerLevelPassed, // Depends on the Beginner level pass status
              onTap: () {
                if (_isBeginnerLevelPassed) {
                  Navigator.pushNamed(
                    context,
                    RoutesNames.levelDetails,
                    arguments: 'Advanced',
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please pass the Beginner level first to unlock this level.')),
                  );
                }
              },
            ),
          ],
        ),
      ),
      // Floating action button for testing (for development only)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // This button is for testing only - can be removed in production
          // When pressed, it toggles the Beginner level pass status
          _setBeginnerLevelPassed(!_isBeginnerLevelPassed);
        },
        child: Icon(_isBeginnerLevelPassed ? Icons.lock_open : Icons.lock),
      ),
    );
  }
}