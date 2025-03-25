class NumerologyModel {
  final int id;
  final int userId;
  final String fullName;
  final String dateOfBirth;
  final int lifePathNumber;
  final int destinyNumber;
  final int personalityNumber;
  final int soulNumber;
  final Map<String, dynamic> analysis;
  final List<String> strengths;
  final List<String> weaknesses;
  final List<String> suitableCareers;
  final DateTime createdAt;

  NumerologyModel({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.dateOfBirth,
    required this.lifePathNumber,
    required this.destinyNumber,
    required this.personalityNumber,
    required this.soulNumber,
    required this.analysis,
    required this.strengths,
    required this.weaknesses,
    required this.suitableCareers,
    required this.createdAt,
  });

  factory NumerologyModel.fromJson(Map<String, dynamic> json) {
    return NumerologyModel(
      id: json['id'],
      userId: json['userId'],
      fullName: json['fullName'],
      dateOfBirth: json['dateOfBirth'],
      lifePathNumber: json['lifePathNumber'],
      destinyNumber: json['destinyNumber'],
      personalityNumber: json['personalityNumber'],
      soulNumber: json['soulNumber'],
      analysis: Map<String, dynamic>.from(json['analysis']),
      strengths: List<String>.from(json['strengths']),
      weaknesses: List<String>.from(json['weaknesses']),
      suitableCareers: List<String>.from(json['suitableCareers']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth,
      'lifePathNumber': lifePathNumber,
      'destinyNumber': destinyNumber,
      'personalityNumber': personalityNumber,
      'soulNumber': soulNumber,
      'analysis': analysis,
      'strengths': strengths,
      'weaknesses': weaknesses,
      'suitableCareers': suitableCareers,
      'createdAt': createdAt.toIso8601String(),
    };
  }
} 