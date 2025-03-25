import 'package:get_it/get_it.dart';
import 'package:huongnghiep/repositories/auth_repository.dart';
import 'package:huongnghiep/repositories/analysis_repository.dart';
import 'package:huongnghiep/repositories/consultation_repository.dart';
import 'package:huongnghiep/repositories/numerology_repository.dart';
import 'package:huongnghiep/repositories/survey_repository.dart';
import 'package:huongnghiep/services/mock_api_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Services
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<MockApiService>(MockApiService());

  // Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(getIt<MockApiService>(), getIt<SharedPreferences>()),
  );
  
  getIt.registerSingleton<AnalysisRepository>(
    AnalysisRepository(getIt<MockApiService>()),
  );
  
  getIt.registerSingleton<ConsultationRepository>(
    ConsultationRepository(getIt<MockApiService>()),
  );
  
  getIt.registerSingleton<NumerologyRepository>(
    NumerologyRepository(getIt<MockApiService>()),
  );
  
  getIt.registerSingleton<SurveyRepository>(
    SurveyRepository(getIt<MockApiService>()),
  );
}

List<SingleChildWidget> getProviders() {
  return [
    Provider<AuthRepository>(create: (_) => getIt<AuthRepository>()),
    Provider<AnalysisRepository>(create: (_) => getIt<AnalysisRepository>()),
    Provider<ConsultationRepository>(create: (_) => getIt<ConsultationRepository>()),
    Provider<NumerologyRepository>(create: (_) => getIt<NumerologyRepository>()),
    Provider<SurveyRepository>(create: (_) => getIt<SurveyRepository>()),
  ];
} 