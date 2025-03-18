import 'dart:convert';

class ChatModel {
  final String? name;
  final String? icon;
  final bool? isGroup;
  final String? time;
  final String? currentMessage;
  final String? status;
   bool? select;
  final int? id;
  ChatModel({
     this.name,
     this.icon,
     this.isGroup,
     this.time,
     this.currentMessage,
     this.status,
     this.select,
     this.id,
  });
  

  ChatModel copyWith({
    String? name,
    String? icon,
    bool? isGroup,
    String? time,
    String? currentMessage,
    String? status,
    bool? select,
    int? id,
  }) {
    return ChatModel(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      isGroup: isGroup ?? this.isGroup,
      time: time ?? this.time,
      currentMessage: currentMessage ?? this.currentMessage,
      status: status ?? this.status,
      select: select ?? this.select,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'icon': icon,
      'isGroup': isGroup,
      'time': time,
      'currentMessage': currentMessage,
      'status': status,
      'select': select,
      'id': id,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      name: map['name'] ?? '',
      icon: map['icon'] ?? '',
      isGroup: map['isGroup'] ?? false,
      time: map['time'] ?? '',
      currentMessage: map['currentMessage'] ?? '',
      status: map['status'] ?? '',
      select: map['select'] ?? false,
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatModel(name: $name, icon: $icon, isGroup: $isGroup, time: $time, currentMessage: $currentMessage, status: $status, select: $select, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChatModel &&
      other.name == name &&
      other.icon == icon &&
      other.isGroup == isGroup &&
      other.time == time &&
      other.currentMessage == currentMessage &&
      other.status == status &&
      other.select == select &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      icon.hashCode ^
      isGroup.hashCode ^
      time.hashCode ^
      currentMessage.hashCode ^
      status.hashCode ^
      select.hashCode ^
      id.hashCode;
  }
}
