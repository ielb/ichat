import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ichat/src/models/message.dart';

@immutable
class Room {
  final String id;
  final String name;
  final String? image;
  final String? description;
  final String? type;
  final DateTime createdAt;

  final List<Message> messages;

  const Room({
    required this.id,
    required this.name,
    this.image,
    this.description,
    this.type,
    required this.createdAt,
    this.messages = const [],
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json['id'] as String,
        name: json['name'] as String,
        image: json['image'] as String?,
        description: json['description'] as String?,
        type: json['type'] as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        messages: (json['messages'] as List<dynamic>?)
                ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'type': type,
        'created_at': createdAt.toIso8601String(),
      };
}
