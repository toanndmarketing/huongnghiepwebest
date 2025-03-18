import 'package:json_annotation/json_annotation.dart';

part 'survey_model.g.dart';

@JsonSerializable()
class SurveyModel {
  final int id;
  final int userId;
  final List<SurveyQuestion> questions;
  final Map<String, dynamic> answers;
  final DateTime createdAt;
  final DateTime? completedAt;

  SurveyModel({
    required this.id,
    required this.userId,
    required this.questions,
    required this.answers,
    required this.createdAt,
    this.completedAt,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) => _$SurveyModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$SurveyModelToJson(this);
}

@JsonSerializable()
class SurveyQuestion {
  final int id;
  final String question;
  final String type; // text, multipleChoice, checkbox
  final List<String>? options;
  final bool isRequired;

  SurveyQuestion({
    required this.id,
    required this.question,
    required this.type,
    this.options,
    required this.isRequired,
  });

  factory SurveyQuestion.fromJson(Map<String, dynamic> json) => _$SurveyQuestionFromJson(json);
  
  Map<String, dynamic> toJson() => _$SurveyQuestionToJson(this);
} 