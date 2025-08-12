import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_screen.dart'; // Écran d'onboarding
import 'main_app_screen.dart'; // Écran principal avec la navigation

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _getSeenOnboarding() async {
    try {
      final prefs = await SharedPreferences.getInstance().timeout(
        const Duration(seconds: 10),
      );
      return prefs.getBool('seenOnboarding') ?? false;
    } on TimeoutException catch (_) {
      // Timeout occurred
      return false; // Defaults to showing onboarding screen
    } catch (e) {
      // Other errors
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PagesJaunes Clone',
      home: FutureBuilder<bool>(
        future: _getSeenOnboarding(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasError) {
            // En cas d’erreur on peut aussi afficher directement l’onboarding
            return const OnboardingScreen();
          }
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return const MainAppScreen();
            } else {
              return const OnboardingScreen();
            }
          }
          // Cas fallback : par défaut onboarding
          return const OnboardingScreen();
        },
      ),
    );
  }
}

