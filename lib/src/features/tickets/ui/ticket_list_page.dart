import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TicketsListPage extends StatefulWidget {
  const TicketsListPage({super.key});

  @override
  State<TicketsListPage> createState() => _TicketsListPageState();
}

class _TicketsListPageState extends State<TicketsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tickets"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/tickets/create');
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: context.watch<TicketsViewModel>().tickets.length,
        itemBuilder: (context, index) {
          final currentTicket =
              context.watch<TicketsViewModel>().tickets[index];
          return ListTile(
            title: Text(currentTicket.id!),
            onTap: () {
              context.go('/tickets/${currentTicket.id}');
            },
          );
        },
      ),
    );
  }
}
