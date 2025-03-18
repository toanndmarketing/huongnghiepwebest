import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
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
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
} 