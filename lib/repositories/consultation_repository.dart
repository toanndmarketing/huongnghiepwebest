import 'package:huongnghiep/models/consultation_model.dart';
import 'package:huongnghiep/services/mock_api_service.dart';

class ConsultationRepository {
  final MockApiService _apiService;

  ConsultationRepository(this._apiService);
  
  // Lấy danh sách gói tư vấn
  Future<List<ConsultationPackageModel>> getConsultationPackages() async {
    try {
      final response = await _apiService.get('consultation/packages');
      
      if (response['success'] == true) {
        final List<dynamic> data = response['data'];
        return data.map((item) => ConsultationPackageModel.fromJson(item)).toList();
      } else {
        throw Exception(response['message'] ?? 'Lấy danh sách gói tư vấn thất bại');
      }
    } catch (e) {
      throw Exception('Lấy danh sách gói tư vấn thất bại: $e');
    }
  }
  
  // Lấy danh sách chuyên gia tư vấn
  Future<List<ExpertModel>> getExperts() async {
    try {
      final response = await _apiService.get('consultation/experts');
      
      if (response['success'] == true) {
        final List<dynamic> data = response['data'];
        return data.map((item) => ExpertModel.fromJson(item)).toList();
      } else {
        throw Exception(response['message'] ?? 'Lấy danh sách chuyên gia thất bại');
      }
    } catch (e) {
      throw Exception('Lấy danh sách chuyên gia thất bại: $e');
    }
  }
  
  // Đặt lịch tư vấn
  Future<ConsultationModel> scheduleConsultation(int userId, int expertId, String packageType, DateTime appointmentDate, {String? notes}) async {
    try {
      final response = await _apiService.post('consultation/schedule', {
        'userId': userId,
        'expertId': expertId,
        'packageType': packageType,
        'appointmentDate': appointmentDate.toIso8601String(),
        'notes': notes,
      });
      
      if (response['success'] == true) {
        return ConsultationModel.fromJson(response['data']);
      } else {
        throw Exception(response['message'] ?? 'Đặt lịch tư vấn thất bại');
      }
    } catch (e) {
      throw Exception('Đặt lịch tư vấn thất bại: $e');
    }
  }
  
  // Lấy danh sách lịch tư vấn của người dùng
  Future<List<ConsultationModel>> getUserConsultations(int userId) async {
    try {
      final response = await _apiService.get('consultation/user', queryParams: {'userId': userId});
      
      if (response['success'] == true) {
        final List<dynamic> data = response['data'];
        return data.map((item) => ConsultationModel.fromJson(item)).toList();
      } else {
        throw Exception(response['message'] ?? 'Lấy danh sách lịch tư vấn thất bại');
      }
    } catch (e) {
      throw Exception('Lấy danh sách lịch tư vấn thất bại: $e');
    }
  }
  
  // Lấy chi tiết một lịch tư vấn
  Future<ConsultationModel> getConsultationDetail(int id) async {
    try {
      final response = await _apiService.getById('consultation', id);
      
      if (response['data'] != null) {
        return ConsultationModel.fromJson(response['data']);
      } else {
        throw Exception('Không tìm thấy lịch tư vấn');
      }
    } catch (e) {
      throw Exception('Lấy chi tiết lịch tư vấn thất bại: $e');
    }
  }
  
  // Hủy lịch tư vấn
  Future<bool> cancelConsultation(int id) async {
    try {
      final response = await _apiService.put('consultation/cancel', id, {});
      
      return response['success'] == true;
    } catch (e) {
      throw Exception('Hủy lịch tư vấn thất bại: $e');
    }
  }
} 