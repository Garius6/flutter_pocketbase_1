import 'package:flutter_pocketbase_1/src/features/tickets/domain.dart';
import 'package:pocketbase/pocketbase.dart';

class TicketsPocketbaseDataSource {
  TicketsPocketbaseDataSource({required this.pb});

  final _collectionName = 'tickets';
  final PocketBase pb;

  Future<void> create(Ticket t) async {
    await pb.collection(_collectionName).create(body: t.toJson());
  }

  Future<List<Ticket>> getAll() async {
    final records = await pb.collection(_collectionName).getFullList();
    return records.map((e) => Ticket.fromRecordModel(e)).toList();
  }

  Future<void> update(Ticket t) async {
    await pb.collection(_collectionName).update(t.id!, body: t.toJson());
  }

  Future<Ticket> getById(String id) async {
    final record = await pb.collection(_collectionName).getOne(id);
    return Ticket.fromRecordModel(record);
  }
}
