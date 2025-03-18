import 'package:json_annotation/json_annotation.dart';

part 'analysis_result_model.g.dart';

@JsonSerializable()
class AnalysisResultModel {
  final int id;
  final int userId;
  final String type; // numerology, survey, combined
  final List<String> strengths;
  final List<String> weaknesses;
  final List<CareerRecommendation> recommendedCareers;
  final List<DevelopmentPath> developmentPaths;
  final DateTime createdAt;

  AnalysisResultModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.strengths,
    required this.weaknesses,
    required this.recommendedCareers,
    required this.developmentPaths,
    required this.createdAt,
  });

  factory AnalysisResultModel.fromJson(Map<String, dynamic> json) => _$AnalysisResultModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$AnalysisResultModelToJson(this);
}

@JsonSerializable()
class CareerRecommendation {
  final String career;
  final double compatibility;
  final String description;
  final List<String> requiredSkills;
  final String outlookDescription;
  final double outlookRating; // 1-5

  CareerRecommendation({
    required this.career,
    required this.compatibility,
    required this.description,
    required this.requiredSkills,
    required this.outlookDescription,
    required this.outlookRating,
  });

  factory CareerRecommendation.fromJson(Map<String, dynamic> json) => _$CareerRecommendationFromJson(json);
  
  Map<String, dynamic> toJson() => _$CareerRecommendationToJson(this);
}

@JsonSerializable()
class DevelopmentPath {
  final String title;
  final String description;
  final List<String> steps;
  final List<String> resources;

  DevelopmentPath({
    required this.title,
    required this.description,
    required this.steps,
    required this.resources,
  });

  factory DevelopmentPath.fromJson(Map<String, dynamic> json) => _$DevelopmentPathFromJson(json);
  
  Map<String, dynamic> toJson() => _$DevelopmentPathToJson(this);
} 