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

  factory ConsultationModel.fromJson(Map<String, dynamic> json) {
    return ConsultationModel(
      id: json['id'],
      userId: json['userId'],
      expertId: json['expertId'],
      packageType: json['packageType'],
      price: json['price'].toDouble(),
      status: json['status'],
      appointmentDate: DateTime.parse(json['appointmentDate']),
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      expert: ExpertModel.fromJson(json['expert']),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'expertId': expertId,
      'packageType': packageType,
      'price': price,
      'status': status,
      'appointmentDate': appointmentDate.toIso8601String(),
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'expert': expert.toJson(),
    };
  }
}

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

  factory ExpertModel.fromJson(Map<String, dynamic> json) {
    return ExpertModel(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      experience: json['experience'],
      avatar: json['avatar'],
      description: json['description'],
      specialties: List<String>.from(json['specialties']),
      rating: json['rating'].toDouble(),
      consultationsCount: json['consultationsCount'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'experience': experience,
      'avatar': avatar,
      'description': description,
      'specialties': specialties,
      'rating': rating,
      'consultationsCount': consultationsCount,
    };
  }
}

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

  factory ConsultationPackageModel.fromJson(Map<String, dynamic> json) {
    return ConsultationPackageModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      features: List<String>.from(json['features']),
      durationMinutes: json['durationMinutes'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'features': features,
      'durationMinutes': durationMinutes,
    };
  }
} 