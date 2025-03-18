import 'package:huongnghiep/models/survey_model.dart';
import 'package:huongnghiep/services/mock_api_service.dart';

class SurveyRepository {
  final MockApiService _apiService;

  SurveyRepository(this._apiService);
  
  // Lấy danh sách câu hỏi khảo sát
  Future<List<SurveyQuestion>> getSurveyQuestions() async {
    try {
      final response = await _apiService.get('survey/questions');
      
      if (response['success'] == true) {
        final List<dynamic> data = response['data'];
        return data.map((item) => SurveyQuestion.fromJson(item)).toList();
      } else {
        throw Exception(response['message'] ?? 'Lấy danh sách câu hỏi thất bại');
      }
    } catch (e) {
      throw Exception('Lấy danh sách câu hỏi thất bại: $e');
    }
  }
  
  // Nộp câu trả lời khảo sát
  Future<SurveyModel> submitSurvey(int userId, Map<String, dynamic> answers) async {
    try {
      final response = await _apiService.post('survey/submit', {
        'userId': userId,
        'answers': answers,
      });
      
      if (response['success'] == true) {
        return SurveyModel.fromJson(response['data']);
      } else {
        throw Exception(response['message'] ?? 'Nộp khảo sát thất bại');
      }
    } catch (e) {
      throw Exception('Nộp khảo sát thất bại: $e');
    }
  }
  
  // Lấy lịch sử khảo sát
  Future<List<SurveyModel>> getSurveyHistory(int userId) async {
    try {
      final response = await _apiService.get('survey/history', queryParams: {'userId': userId});
      
      if (response['success'] == true) {
        final List<dynamic> data = response['data'];
        return data.map((item) => SurveyModel.fromJson(item)).toList();
      } else {
        throw Exception(response['message'] ?? 'Lấy lịch sử khảo sát thất bại');
      }
    } catch (e) {
      throw Exception('Lấy lịch sử khảo sát thất bại: $e');
    }
  }
  
  // Lấy chi tiết một khảo sát
  Future<SurveyModel> getSurveyDetail(int id) async {
    try {
      final response = await _apiService.getById('survey', id);
      
      if (response['data'] != null) {
        return SurveyModel.fromJson(response['data']);
      } else {
        throw Exception('Không tìm thấy khảo sát');
      }
    } catch (e) {
      throw Exception('Lấy chi tiết khảo sát thất bại: $e');
    }
  }
} 