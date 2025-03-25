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

  factory AnalysisResultModel.fromJson(Map<String, dynamic> json) {
    return AnalysisResultModel(
      id: json['id'],
      userId: json['userId'],
      type: json['type'],
      strengths: List<String>.from(json['strengths']),
      weaknesses: List<String>.from(json['weaknesses']),
      recommendedCareers: (json['recommendedCareers'] as List)
          .map((career) => CareerRecommendation.fromJson(career))
          .toList(),
      developmentPaths: (json['developmentPaths'] as List)
          .map((path) => DevelopmentPath.fromJson(path))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'strengths': strengths,
      'weaknesses': weaknesses,
      'recommendedCareers': recommendedCareers.map((career) => career.toJson()).toList(),
      'developmentPaths': developmentPaths.map((path) => path.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

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

  factory CareerRecommendation.fromJson(Map<String, dynamic> json) {
    return CareerRecommendation(
      career: json['career'],
      compatibility: json['compatibility'].toDouble(),
      description: json['description'],
      requiredSkills: List<String>.from(json['requiredSkills']),
      outlookDescription: json['outlookDescription'],
      outlookRating: json['outlookRating'].toDouble(),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'career': career,
      'compatibility': compatibility,
      'description': description,
      'requiredSkills': requiredSkills,
      'outlookDescription': outlookDescription,
      'outlookRating': outlookRating,
    };
  }
}

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

  factory DevelopmentPath.fromJson(Map<String, dynamic> json) {
    return DevelopmentPath(
      title: json['title'],
      description: json['description'],
      steps: List<String>.from(json['steps']),
      resources: List<String>.from(json['resources']),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'steps': steps,
      'resources': resources,
    };
  }
} 