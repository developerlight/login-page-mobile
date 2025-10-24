import 'package:app/presentation/screens/dashboard_page.dart';
import 'package:app/presentation/screens/forgotPassword_page.dart';
import 'package:app/presentation/screens/login_page.dart';
import 'package:app/presentation/screens/newPassword_page.dart';
import 'package:app/presentation/screens/profile_page.dart';
import 'package:app/presentation/screens/register_page.dart';
import 'package:app/presentation/screens/setting_page.dart';
import 'package:app/presentation/screens/verifiedForgotPassword_page.dart';
import 'package:flutter/material.dart';
import 'package:app/presentation/screens/search_page.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const Login()
        );
      
      case '/dashboard':
        return MaterialPageRoute(
          builder: (_) => const DashboardPage()
        );
      
      case '/forgotPassword':
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordPage()
        );
      
      case '/newPassword':
        return MaterialPageRoute(
          builder: (_) => const NewPasswordPage()
        );
      
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => const ProfilePage()
        );
      
      case '/register':
        return MaterialPageRoute(
          builder: (_) => const RegisterPage()
        );
      
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsPage()
        );
      
      case '/verifiedForgotPassword':
        return MaterialPageRoute(
          builder: (_) => const VerifiedForgotPasswordPage()
        );

      case '/search':
        return MaterialPageRoute(
          builder: (_) => const SearchPage()
        );
      
      default :
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}