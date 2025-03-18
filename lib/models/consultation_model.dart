import 'package:json_annotation/json_annotation.dart';

part 'consultation_model.g.dart';

@JsonSerializable()
class ConsultationModel {
  final int id;
  final int userId;
  final int expertId;
  final String packageType; // basic, premium
  final double price;
  final String status; // pending, approved, completed, cancelled
  final DateTime appointmentDate;
  final String? notes;
  final DateTime createdAt;
  final ExpertModel expert;

  ConsultationModel({
    required this.id,
    required this.userId,
    required this.expertId,
    required this.packageType,
    required this.price,
    required this.status,
    required this.appointmentDate,
    this.notes,
    required this.createdAt,
    required this.expert,
  });

  factory ConsultationModel.fromJson(Map<String, dynamic> json) => _$ConsultationModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$ConsultationModelToJson(this);
}

@JsonSerializable()
class ExpertModel {
  final int id;
  final String name;
  final String title;
  final String experience;
  final String? avatar;
  final String description;
  final List<String> specialties;
  final double rating;
  final int consultationsCount;

  ExpertModel({
    required this.id,
    required this.name,
    required this.title,
    required this.experience,
    this.avatar,
    required this.description,
    required this.specialties,
    required this.rating,
    required this.consultationsCount,
  });

  factory ExpertModel.fromJson(Map<String, dynamic> json) => _$ExpertModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExpertModelToJson(this);
}

@JsonSerializable()
class ConsultationPackageModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> features;
  final int durationMinutes;

  ConsultationPackageModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.features,
    required this.durationMinutes,
  });

  factory ConsultationPackageModel.fromJson(Map<String, dynamic> json) => _$ConsultationPackageModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$ConsultationPackageModelToJson(this);
} 