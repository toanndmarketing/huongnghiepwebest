import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get apiUrl => dotenv.env['API_URL'] ?? 'http://localhost:8000/api';
  static String get appName => 'Hướng Nghiệp';
  
  // API Endpoints
  static String get loginEndpoint => '/auth/login';
  static String get registerEndpoint => '/auth/register';
  static String get numerologyEndpoint => '/numerology/analyze';
  static String get surveyEndpoint => '/survey/submit';
  static String get analysisEndpoint => '/analysis/results';
  static String get consultationEndpoint => '/consultation';

  // Storage Keys
  static String get tokenKey => 'auth_token';
  static String get userKey => 'user_data';

  // Timeouts
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;

  // Pagination
  static const int defaultPageSize = 10;
} 