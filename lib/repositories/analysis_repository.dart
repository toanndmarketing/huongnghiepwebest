import 'package:huongnghiep/models/analysis_result_model.dart';
import 'package:huongnghiep/services/mock_api_service.dart';

class AnalysisRepository {
  final MockApiService _apiService;

  AnalysisRepository(this._apiService);
  
  // Lấy kết quả phân tích dựa trên ID của người dùng và loại phân tích
  Future<List<AnalysisResultModel>> getAnalysisResults(int userId, {String? type}) async {
    try {
      Map<String, dynamic> queryParams = {'userId': userId};
      if (type != null) {
        queryParams['type'] = type;
      }
      
      final response = await _apiService.get('analysis/results', queryParams: queryParams);
      
      if (response['success'] == true) {
        final List<dynamic> data = response['data'];
        return data.map((item) => AnalysisResultModel.fromJson(item)).toList();
      } else {
        throw Exception(response['message'] ?? 'Lấy kết quả phân tích thất bại');
      }
    } catch (e) {
      throw Exception('Lấy kết quả phân tích thất bại: $e');
    }
  }
  
  // Lấy chi tiết một kết quả phân tích
  Future<AnalysisResultModel> getAnalysisResult(int id) async {
    try {
      final response = await _apiService.getById('analysis/results', id);
      
      if (response['data'] != null) {
        return AnalysisResultModel.fromJson(response['data']);
      } else {
        throw Exception('Không tìm thấy kết quả phân tích');
      }
    } catch (e) {
      throw Exception('Lấy chi tiết kết quả phân tích thất bại: $e');
    }
  }
  
  // Lấy gợi ý nghề nghiệp phù hợp dựa trên kết quả phân tích
  Future<List<CareerRecommendation>> getCareerRecommendations(int analysisId) async {
    try {
      final response = await _apiService.get('analysis/careers', queryParams: {'analysisId': analysisId});
      
      if (response['success'] == true) {
        final List<dynamic> data = response['data'];
        return data.map((item) => CareerRecommendation.fromJson(item)).toList();
      } else {
        throw Exception(response['message'] ?? 'Lấy gợi ý nghề nghiệp thất bại');
      }
    } catch (e) {
      throw Exception('Lấy gợi ý nghề nghiệp thất bại: $e');
    }
  }
  
  // Lấy lộ trình phát triển dựa trên kết quả phân tích
  Future<List<DevelopmentPath>> getDevelopmentPaths(int analysisId) async {
    try {
      final response = await _apiService.get('analysis/development', queryParams: {'analysisId': analysisId});
      
      if (response['success'] == true) {
        final List<dynamic> data = response['data'];
        return data.map((item) => DevelopmentPath.fromJson(item)).toList();
      } else {
        throw Exception(response['message'] ?? 'Lấy lộ trình phát triển thất bại');
      }
    } catch (e) {
      throw Exception('Lấy lộ trình phát triển thất bại: $e');
    }
  }
} 