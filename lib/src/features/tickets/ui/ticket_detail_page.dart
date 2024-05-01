import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_1/src/features/auth/view_model.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/domain.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TicketDetailPage extends StatefulWidget {
  const TicketDetailPage({required this.ticketId, super.key});

  final String ticketId;

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  late Future<Ticket> _futureTicket;

  @override
  void initState() {
    super.initState();
    _futureTicket = _fetchTicket();
  }

  Future<Ticket> _fetchTicket() async {
    return await context.read<TicketsViewModel>().getById(widget.ticketId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureTicket,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final currentTicket = snapshot.data!;
            return TicketDetails(currentTicket: currentTicket);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class TicketDetails extends StatelessWidget {
  const TicketDetails({
    super.key,
    required this.currentTicket,
  });

  final Ticket currentTicket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.go('/tickets/${currentTicket.id}/edit');
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: Column(
          children: [
            Text(currentTicket.id!),
            Text(
              currentTicket.content,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ));
  }
}
