import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:huongnghiep/config/app_config.dart';
import 'package:huongnghiep/config/di_config.dart';
import 'package:huongnghiep/config/theme_config.dart';
import 'package:huongnghiep/screens/auth/login_screen.dart';
import 'package:huongnghiep/screens/auth/register_screen.dart';
import 'package:huongnghiep/screens/home/home_screen.dart';
import 'package:huongnghiep/screens/numerology/numerology_screen.dart';
import 'package:huongnghiep/screens/survey/survey_screen.dart';
import 'package:huongnghiep/screens/analysis/analysis_results_screen.dart';
import 'package:huongnghiep/screens/consultation/consultation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await dotenv.load(fileName: ".env");
  
  // Setup dependencies
  await setupDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/numerology': (context) => const NumerologyScreen(),
        '/survey': (context) => const SurveyScreen(),
        '/analysis': (context) => const AnalysisResultsScreen(),
        '/consultation': (context) => const ConsultationScreen(),
      },
    );
  }
}
