import 'dart:convert';

class MessageModel {
  final String type;
  final String message;
 final String time;
  MessageModel({
    required this.type,
    required this.message,
    required this.time,
  });
  

  MessageModel copyWith({
    String? type,
    String? message,
    String? time,
  }) {
    return MessageModel(
      type: type ?? this.type,
      message: message ?? this.message,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'message': message,
      'time': time,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      type: map['type'] ?? '',
      message: map['message'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source));

  @override
  String toString() => 'MessageModel(type: $type, message: $message, time: $time)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MessageModel &&
      other.type == type &&
      other.message == message &&
      other.time == time;
  }

  @override
  int get hashCode => type.hashCode ^ message.hashCode ^ time.hashCode;
}
