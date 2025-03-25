import 'dart:convert';
import 'dart:developer' as developer;
import 'package:huongnghiep/models/api_response.dart';
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
  Future<ApiResponse<UserModel>> login(String email, String password) async {
    try {
      developer.log('Attempting to login with email: $email');
      final response = await _apiService.get('auth_login');
      developer.log('Login response received: ${response['success']}');
      
      if (response['success'] == true) {
        final userData = response['data']['user'];
        final token = response['data']['token'];
        
        // Kiểm tra tài khoản
        if (email != userData['email'] || password != '123456') { // Giả lập mật khẩu
          developer.log('Login failed: Invalid credentials');
          return ApiResponse.error('Email hoặc mật khẩu không đúng');
        }
        
        // Lưu token và thông tin người dùng
        await _prefs.setString(_authTokenKey, token);
        await _prefs.setString(_userDataKey, json.encode(userData));
        
        final user = UserModel.fromJson(userData);
        developer.log('Login successful for user: ${user.name}');
        return ApiResponse.success(user);
      } else {
        developer.log('Login failed: ${response['message'] ?? 'Unknown error'}');
        return ApiResponse.error(response['message'] ?? 'Đăng nhập thất bại');
      }
    } catch (e) {
      developer.log('Login exception: $e', error: e);
      return ApiResponse.error('Đăng nhập thất bại: $e');
    }
  }
  
  // Đăng ký
  Future<ApiResponse<UserModel>> register(String name, String email, String password) async {
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
        
        final user = UserModel.fromJson(userData['user']);
        return ApiResponse.success(user);
      } else {
        return ApiResponse.error(response['message'] ?? 'Đăng ký thất bại');
      }
    } catch (e) {
      return ApiResponse.error('Đăng ký thất bại: $e');
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
  Future<ApiResponse<UserModel>> updateProfile(Map<String, dynamic> data) async {
    final currentUser = getCurrentUser();
    if (currentUser == null) {
      return ApiResponse.error('Không tìm thấy thông tin người dùng');
    }
    
    try {
      final response = await _apiService.put('users', currentUser.id, data);
      
      if (response['success'] == true) {
        final updatedUser = response['data'];
        
        // Cập nhật thông tin người dùng đã lưu
        await _prefs.setString(_userDataKey, json.encode(updatedUser));
        
        final user = UserModel.fromJson(updatedUser);
        return ApiResponse.success(user);
      } else {
        return ApiResponse.error(response['message'] ?? 'Cập nhật thông tin thất bại');
      }
    } catch (e) {
      return ApiResponse.error('Cập nhật thông tin thất bại: $e');
    }
  }
} 