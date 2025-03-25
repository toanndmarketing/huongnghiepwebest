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

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      id: json['id'],
      userId: json['userId'],
      questions: (json['questions'] as List)
          .map((q) => SurveyQuestion.fromJson(q))
          .toList(),
      answers: Map<String, dynamic>.from(json['answers']),
      createdAt: DateTime.parse(json['createdAt']),
      completedAt: json['completedAt'] != null 
          ? DateTime.parse(json['completedAt']) 
          : null,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'questions': questions.map((q) => q.toJson()).toList(),
      'answers': answers,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }
}

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

  factory SurveyQuestion.fromJson(Map<String, dynamic> json) {
    return SurveyQuestion(
      id: json['id'],
      question: json['question'],
      type: json['type'],
      options: json['options'] != null 
          ? List<String>.from(json['options']) 
          : null,
      isRequired: json['isRequired'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'type': type,
      'options': options,
      'isRequired': isRequired,
    };
  }
} 