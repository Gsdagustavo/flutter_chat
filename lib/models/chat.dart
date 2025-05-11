import 'message.dart';

class Chat {
  int id;
  List<dynamic> participants;
  List<dynamic> messages;

  Chat(this.id, this.participants, this.messages);

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(json['id'], json['participants'], json['messages']);
  }

  @override
  String toString() {
    return 'Chat{id: $id, participants: $participants, messages: $messages}';
  }
}
