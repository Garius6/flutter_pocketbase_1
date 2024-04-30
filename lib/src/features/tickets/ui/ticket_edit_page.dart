import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/domain.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TicketEditPage extends StatefulWidget {
  const TicketEditPage({required this.ticketId, super.key});

  final String ticketId;

  @override
  State<TicketEditPage> createState() => _TicketEditPageState();
}

class _TicketEditPageState extends State<TicketEditPage> {
  final _contentController = TextEditingController();

  late Future<Ticket> _ticketFuture;

  Future<Ticket> _getTicket() {
    return context.read<TicketsViewModel>().getById(widget.ticketId);
  }

  @override
  void initState() {
    super.initState();

    _ticketFuture = _getTicket();
  }

  @override
  void dispose() {
    super.dispose();

    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _ticketFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final ticket = snapshot.data!;
          _contentController.text = ticket.content;
          return Scaffold(
            body: Form(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _contentController,
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          await context.read<TicketsViewModel>().update(ticket
                              .copyWith(content: _contentController.text));

                          if (context.mounted) {
                            context.go('/tickets');
                          }
                        },
                        child: const Text("Save")),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
              body: Center(
            child: Text(snapshot.error.toString()),
          ));
        } else {
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }
}
