import 'package:pocketbase/pocketbase.dart';

class Ticket {
  Ticket({required this.title, required this.content, this.id});

  final String? id;
  final String title;
  final String content;

  factory Ticket.fromRecordModel(RecordModel record) {
    return Ticket(
        title: record.data["title"],
        content: record.data["content"],
        id: record.id);
  }

  Map<String, dynamic> toJson() => {"title": title, "content": content};
  Ticket copyWith({String? id, String? title, String? content}) {
    return Ticket(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content);
  }
}
