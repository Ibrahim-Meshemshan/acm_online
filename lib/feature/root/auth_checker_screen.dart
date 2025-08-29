import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // تأكد من إضافة shared_preferences لملف pubspec.yaml
import 'package:acm_online/core/routes_manager/routes_names.dart';

class AuthCheckerScreen extends StatefulWidget {
  const AuthCheckerScreen({super.key});

  @override
  State<AuthCheckerScreen> createState() => _AuthCheckerScreenState();
}

class _AuthCheckerScreenState extends State<AuthCheckerScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // تحقق مما إذا كانت الرموز موجودة. لتطبيق حقيقي، قد تحتاج أيضًا للتحقق من انتهاء صلاحية الرمز.
    final String? accessToken = prefs.getString('access_token');
    final String? refreshToken = prefs.getString('refresh_token');

    // أضف تأخيرًا بسيطًا لمحاكاة التحميل أو لإظهار شاشة البداية لفترة وجيزة
    await Future.delayed(const Duration(milliseconds: 1500)); // عدلها حسب حاجتك

    if (accessToken != null && accessToken.isNotEmpty && refreshToken != null && refreshToken.isNotEmpty) {
      // المستخدم مسجل دخول، اذهب إلى الشاشة الرئيسية
      if (mounted) { // تحقق لتجنب الخطأ إذا تم إلغاء الشاشة قبل اكتمال الدالة
        Navigator.pushReplacementNamed(context, RoutesNames.homeBody);
      }
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, RoutesNames.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}