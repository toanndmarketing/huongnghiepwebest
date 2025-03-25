class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final Map<String, dynamic>? errors;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.errors,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return ApiResponse(
      success: json['success'] ?? false,
      data: json['data'] != null ? fromJson(json['data']) : null,
      message: json['message'],
      errors: json['errors'] != null ? Map<String, dynamic>.from(json['errors']) : null,
    );
  }

  factory ApiResponse.success(T data) {
    return ApiResponse(success: true, data: data);
  }

  factory ApiResponse.error(String message, {Map<String, dynamic>? errors}) {
    return ApiResponse(success: false, message: message, errors: errors);
  }
} 