import 'package:huongnghiep/models/numerology_model.dart';
import 'package:huongnghiep/services/mock_api_service.dart';

class NumerologyRepository {
  final MockApiService _apiService;

  NumerologyRepository(this._apiService);
  
  // Phân tích thần số học dựa trên tên và ngày sinh
  Future<NumerologyModel> analyzeNumerology(String fullName, String dateOfBirth, int userId) async {
    try {
      final response = await _apiService.post('numerology/analyze', {
        'userId': userId,
        'fullName': fullName,
        'dateOfBirth': dateOfBirth,
      });
      
      if (response['success'] == true) {
        return NumerologyModel.fromJson(response['data']);
      } else {
        throw Exception(response['message'] ?? 'Phân tích thần số học thất bại');
      }
    } catch (e) {
      throw Exception('Phân tích thần số học thất bại: $e');
    }
  }
  
  // Lấy danh sách phân tích thần số học của người dùng
  Future<List<NumerologyModel>> getNumerologyAnalyses(int userId) async {
    try {
      final response = await _apiService.get('numerology', queryParams: {'userId': userId});
      
      if (response['success'] == true) {
        final List<dynamic> data = response['data'];
        return data.map((item) => NumerologyModel.fromJson(item)).toList();
      } else {
        throw Exception(response['message'] ?? 'Lấy danh sách phân tích thất bại');
      }
    } catch (e) {
      throw Exception('Lấy danh sách phân tích thất bại: $e');
    }
  }
  
  // Lấy chi tiết một phân tích cụ thể
  Future<NumerologyModel> getNumerologyAnalysis(int id) async {
    try {
      final response = await _apiService.getById('numerology', id);
      
      if (response['data'] != null) {
        return NumerologyModel.fromJson(response['data']);
      } else {
        throw Exception('Không tìm thấy phân tích thần số học');
      }
    } catch (e) {
      throw Exception('Lấy chi tiết phân tích thất bại: $e');
    }
  }
} 