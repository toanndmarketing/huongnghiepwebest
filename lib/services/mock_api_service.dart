import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class MockApiService {
  static const String _basePath = 'assets/mock_data';
  
  // Phương thức để đọc dữ liệu từ file JSON
  Future<Map<String, dynamic>> _getJsonData(String filename) async {
    try {
      final String response = await rootBundle.loadString('$_basePath/$filename');
      return json.decode(response) as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Không thể đọc dữ liệu từ $filename: $e');
    }
  }
  
  // Phương thức để giả lập trì hoãn mạng 
  Future<T> _simulateNetworkDelay<T>(T data, {int milliseconds = 800}) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    return data;
  }
  
  // Giả lập phương thức GET
  Future<Map<String, dynamic>> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    final data = await _getJsonData('$endpoint.json');
    return _simulateNetworkDelay(data);
  }
  
  // Giả lập phương thức GET item dựa trên ID
  Future<Map<String, dynamic>> getById(String endpoint, int id) async {
    final data = await _getJsonData('$endpoint.json');
    final items = data['data'] as List<dynamic>;
    
    final item = items.firstWhere(
      (item) => item['id'] == id,
      orElse: () => throw Exception('Không tìm thấy item với id $id'),
    );
    
    return _simulateNetworkDelay({'data': item});
  }
  
  // Giả lập phương thức POST
  Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    // Trong trường hợp này, chúng ta chỉ giả vờ đã lưu dữ liệu và trả về một ID giả định mới
    return _simulateNetworkDelay({
      'success': true,
      'data': {
        ...data as Map<String, dynamic>,
        'id': DateTime.now().millisecondsSinceEpoch,
        'createdAt': DateTime.now().toIso8601String(),
      },
    });
  }
  
  // Giả lập phương thức PUT
  Future<Map<String, dynamic>> put(String endpoint, int id, dynamic data) async {
    return _simulateNetworkDelay({
      'success': true,
      'data': {
        ...data as Map<String, dynamic>,
        'id': id,
        'updatedAt': DateTime.now().toIso8601String(),
      },
    });
  }
  
  // Giả lập phương thức DELETE
  Future<Map<String, dynamic>> delete(String endpoint, int id) async {
    return _simulateNetworkDelay({
      'success': true,
      'message': 'Đã xóa thành công item có id $id',
    });
  }
} 