import 'package:deaf/ProfilePage.dart';
import 'package:deaf/choose_action.dart';
import 'package:deaf/ProgressTracking.dart';
import 'package:deaf/screens/login.dart';
import 'package:deaf/signup.dart';
import 'package:flutter/material.dart';


// Centralized Routes Definition
class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String chooseAction = '/choose';
  static const String profile = '/profile';
  static const String progress = '/progress';

  static final Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    signup: (context) => SignUpScreen(),
    chooseAction: (context) => ChooseActionPage(),
    profile: (context) => ProfilePage(),
    progress: (context) => ProgressTracking(),
  };
}