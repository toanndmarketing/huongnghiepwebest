class UserModel {
  final int id;
  final String name;
  final String email;
  final String? avatar;
  final String? dateOfBirth;
  final String? phone;
  final String? address;
  final String? educationLevel;
  final String? school;
  final String? major;
  final List<String>? interests;
  final List<String>? skills;
  final String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.dateOfBirth,
    this.phone,
    this.address,
    this.educationLevel,
    this.school,
    this.major,
    this.interests,
    this.skills,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      dateOfBirth: json['dateOfBirth'],
      phone: json['phone'],
      address: json['address'],
      educationLevel: json['educationLevel'],
      school: json['school'],
      major: json['major'],
      interests: json['interests'] != null 
          ? List<String>.from(json['interests']) 
          : null,
      skills: json['skills'] != null 
          ? List<String>.from(json['skills']) 
          : null,
      token: json['token'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'dateOfBirth': dateOfBirth,
      'phone': phone,
      'address': address,
      'educationLevel': educationLevel,
      'school': school,
      'major': major,
      'interests': interests,
      'skills': skills,
      'token': token,
    };
  }
} 