import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class User {
  final String id;
  final String name;
  final String phone;
  final String? image;
  final DateTime lastSeen;
  final String createdAt;
  final String updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.phone,
    this.image,
    required this.lastSeen,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        name: json['name'] as String,
        phone: json['phone'] as String,
        image: json['image'] as String?,
        lastSeen: DateTime.parse(json['last_seen'] as String),
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'image': image,
        'last_seen': lastSeen.toIso8601String(),
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
