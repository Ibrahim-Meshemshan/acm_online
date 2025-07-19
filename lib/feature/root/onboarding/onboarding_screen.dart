import 'package:acm_online/feature/root/onboarding/widget/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/app_colors/colors.dart';
import '../../../core/routes_manager/routes_names.dart';
import '../../auth/presentation/widgets/custom_button.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                OnboardingPage(
                  image: Icons.menu_book,
                  title: 'Discover the world of knowledge',
                  description: 'Browse a wide range of educational specializations in diverse fields'
                ),
                OnboardingPage(
                  image: Icons.people_alt, // مثال لأيقونة
                  title: 'Learn effectively',
                  description: 'Participate in discussion forums, ask questions, and interact with a community of students and experts',
                ),
              ],
            ),
          ),
          20.verticalSpace,
          SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: const ExpandingDotsEffect(
              dotColor: AppColors.greyColor,
              activeDotColor: AppColors.primaryColor,
              dotHeight: 8.0,
              dotWidth: 8.0,
              expansionFactor: 4,
            ),
          ),
          50.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomButton(
              onPressed: () {
                if (_currentPage < 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, RoutesNames.login);
                }
              },
              text: _currentPage == 0 ? 'next' : 'Start Now',
            ),
          ),
          50.verticalSpace,
        ],
      ),
    );
  }


}


