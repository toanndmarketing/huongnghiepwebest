import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:huongnghiep/models/user_model.dart';
import 'package:huongnghiep/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  UserModel? _currentUser;
  bool _isLoading = false;
  String? _error;

  AuthProvider(this._authRepository);

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<bool> login(String email, String password) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _authRepository.login(email, password);
      
      if (response.success) {
        _currentUser = response.data;
        _error = null;
        notifyListeners();
        return true;
      } else {
        _error = response.message ?? 'Đăng nhập thất bại';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'Có lỗi xảy ra: ${e.toString()}';
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
} 