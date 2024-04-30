import 'package:pocketbase/pocketbase.dart';

class Ticket {
  Ticket({ required this.content, this.id});

  final String? id;
  final String content;

  factory Ticket.fromRecordModel(RecordModel record) {
    return Ticket(
        content: record.data["content"],
        id: record.id);
  }

  Map<String, dynamic> toJson() => {"content": content};
  Ticket copyWith({String? id, String? title, String? content}) {
    return Ticket(
        id: id ?? this.id,
        content: content ?? this.content);
  }
}
