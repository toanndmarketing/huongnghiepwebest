import 'package:json_annotation/json_annotation.dart';

part 'numerology_model.g.dart';

@JsonSerializable()
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

  factory NumerologyModel.fromJson(Map<String, dynamic> json) => _$NumerologyModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$NumerologyModelToJson(this);
} 