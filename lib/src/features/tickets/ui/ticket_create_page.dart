import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_1/src/features/auth/view_model.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/domain.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TicketCreatePage extends StatefulWidget {
  const TicketCreatePage({super.key});

  @override
  State<TicketCreatePage> createState() => _TicketCreatePageState();
}

class _TicketCreatePageState extends State<TicketCreatePage> {
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    final userId = context.read<AuthViewModel>().user.id;
                    await context.read<TicketsViewModel>().create(Ticket(
                        content: _contentController.text, authorId: userId));

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
  }
}
