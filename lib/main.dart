import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:film_vault/presentation/home.dart';
import 'package:film_vault/widgets/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Vault',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          color: AppColors.transparentColor,
          elevation: 0.0,
          centerTitle: true,
        ),
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('lib/images/logo.png'),
        nextScreen: const HomeScreen(),
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
