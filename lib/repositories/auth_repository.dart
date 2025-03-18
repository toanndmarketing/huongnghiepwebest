import 'dart:convert';
import 'package:huongnghiep/models/user_model.dart';
import 'package:huongnghiep/services/mock_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final MockApiService _apiService;
  final SharedPreferences _prefs;
  
  static const String _authTokenKey = 'auth_token';
  static const String _userDataKey = 'user_data';

  AuthRepository(this._apiService, this._prefs);
  
  // Đăng nhập
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _apiService.post('auth/login', {
        'email': email,
        'password': password,
      });
      
      if (response['success'] == true) {
        final userData = response['data'];
        final token = userData['token'];
        
        // Lưu token và thông tin người dùng
        await _prefs.setString(_authTokenKey, token);
        await _prefs.setString(_userDataKey, json.encode(userData['user']));
        
        return UserModel.fromJson(userData['user']);
      } else {
        throw Exception(response['message'] ?? 'Đăng nhập thất bại');
      }
    } catch (e) {
      throw Exception('Đăng nhập thất bại: $e');
    }
  }
  
  // Đăng ký
  Future<UserModel> register(String name, String email, String password) async {
    try {
      final response = await _apiService.post('auth/register', {
        'name': name,
        'email': email,
        'password': password,
      });
      
      if (response['success'] == true) {
        final userData = response['data'];
        final token = userData['token'];
        
        // Lưu token và thông tin người dùng
        await _prefs.setString(_authTokenKey, token);
        await _prefs.setString(_userDataKey, json.encode(userData['user']));
        
        return UserModel.fromJson(userData['user']);
      } else {
        throw Exception(response['message'] ?? 'Đăng ký thất bại');
      }
    } catch (e) {
      throw Exception('Đăng ký thất bại: $e');
    }
  }
  
  // Đăng xuất
  Future<void> logout() async {
    await _prefs.remove(_authTokenKey);
    await _prefs.remove(_userDataKey);
  }
  
  // Kiểm tra đã đăng nhập chưa
  bool isLoggedIn() {
    return _prefs.containsKey(_authTokenKey);
  }
  
  // Lấy token
  String? getToken() {
    return _prefs.getString(_authTokenKey);
  }
  
  // Lấy thông tin người dùng hiện tại
  UserModel? getCurrentUser() {
    final userJson = _prefs.getString(_userDataKey);
    if (userJson == null) return null;
    
    try {
      return UserModel.fromJson(json.decode(userJson));
    } catch (e) {
      return null;
    }
  }
  
  // Cập nhật thông tin người dùng
  Future<UserModel> updateProfile(Map<String, dynamic> data) async {
    final currentUser = getCurrentUser();
    if (currentUser == null) {
      throw Exception('Không tìm thấy thông tin người dùng');
    }
    
    try {
      final response = await _apiService.put('users', currentUser.id, data);
      
      if (response['success'] == true) {
        final updatedUser = response['data'];
        
        // Cập nhật thông tin người dùng đã lưu
        await _prefs.setString(_userDataKey, json.encode(updatedUser));
        
        return UserModel.fromJson(updatedUser);
      } else {
        throw Exception(response['message'] ?? 'Cập nhật thông tin thất bại');
      }
    } catch (e) {
      throw Exception('Cập nhật thông tin thất bại: $e');
    }
  }
} 