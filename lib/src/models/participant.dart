import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Participant {
  final String id;
  final String userId;
  final String roomId;

  const Participant({
    required this.id,
    required this.userId,
    required this.roomId,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        id: json['id'] as String,
        userId: json['user_id'] as String,
        roomId: json['room_id'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'room_id': roomId,
      };
}
