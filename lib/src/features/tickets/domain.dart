import 'package:pocketbase/pocketbase.dart';

enum TicketStatus { inQueue, started, finished, canceled }

class Ticket {
  Ticket(
      {required this.content,
      required this.authorId,
      this.id,
      this.status = TicketStatus.inQueue});

  final String? id;
  final TicketStatus status;
  final String content;
  final String authorId;

  factory Ticket.fromRecordModel(RecordModel record) {
    final status = (record.data["status"] == "")
        ? TicketStatus.inQueue
        : TicketStatus.values.byName(record.data["status"]);

    return Ticket(
      id: record.id,
      status: status,
      content: record.data["content"],
      authorId: record.data["author"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"content": content, "status": status.name, "author": authorId};

  Ticket copyWith(
      {String? id, String? content, TicketStatus? status, String? authorId}) {
    return Ticket(
      id: id ?? this.id,
      status: status ?? this.status,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
    );
  }
}
