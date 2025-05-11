class Message {
  int id;
  int senderId;
  String content;

  Message(this.id, this.senderId, this.content);

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(json['id'], json['senderId'], json['content']);
  }

  @override
  String toString() {
    return 'Message{id: $id, senderId: $senderId, content: $content}';
  }
}
