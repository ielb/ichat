class Message {
  final String id;
  final String roomId;
  final String participantId;
  final String content;
  final String type;
  final DateTime createdAt;

  const Message({
    required this.id,
    required this.roomId,
    required this.participantId,
    required this.content,
    required this.type,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json['id'] as String,
        roomId: json['room_id'] as String,
        participantId: json['participant_id'] as String,
        content: json['content'] as String,
        type: json['type'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'room_id': roomId,
        'participant_id': participantId,
        'content': content,
        'type': type,
        'created_at': createdAt.toIso8601String(),
      };
}
