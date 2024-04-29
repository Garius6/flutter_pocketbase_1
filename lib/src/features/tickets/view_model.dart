import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/domain.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/pocketbase_data_source.dart';

class TicketsViewModel with ChangeNotifier {
  TicketsViewModel(this.tpd) {
    init();
  }

  final TicketsPocketbaseDataSource tpd;
  var tickets = <Ticket>[];

  Future<void> init() async {
    tickets = await tpd.getAll();
    notifyListeners();
  }

  Future<void> _updateTickets() async {
    tickets = await tpd.getAll();
  }

  Future<void> create(Ticket t) async {
    await tpd.create(t);
    await _updateTickets();
    notifyListeners();
  }

  Future<void> update(t) async {
    await tpd.update(t);
    await _updateTickets();
    notifyListeners();
  }

  Future<Ticket> getById(String id) async {
    return await tpd.getById(id);
  }
}
