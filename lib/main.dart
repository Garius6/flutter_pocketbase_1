import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_1/widgets/credentials.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';

final GoRouter _router = GoRouter(
    redirect: ((context, state) {
      if (context.read<PocketBase>().authStore.isValid ||
          state.fullPath == '/sign_up') {
        return null;
      } else {
        return '/sign_in';
      }
    }),
    initialLocation: '/tickets',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: '/', redirect: (context, state) => "/tickets"),
      GoRoute(
        path: '/tickets',
        builder: (context, state) {
          return const TicketsListPage();
        },
        routes: [
          GoRoute(
            path: 'create',
            builder: (context, state) => const TicketCreatePage(),
          ),
          GoRoute(
              path: ':ticketId',
              builder: (context, state) =>
                  TicketDetailPage(ticketId: state.pathParameters["ticketId"]!),
              routes: [
                GoRoute(
                  path: 'edit',
                  builder: (context, state) => TicketEditPage(
                    ticketId: state.pathParameters["ticketId"]!,
                  ),
                ),
              ])
        ],
      ),
      GoRoute(
        path: '/sign_in',
        builder: (context, state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        path: '/sign_up',
        builder: (context, state) {
          return const SignUpPage();
        },
      )
    ]);

void main() {
  runApp(MultiProvider(
      providers: [Provider(create: (_) => PocketBase("http://10.0.2.2:8090"))],
      child: const PocketBaseApp()));
}

class PocketBaseApp extends StatelessWidget {
  const PocketBaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Credentials(
        onSubmit: (login, password) async {
          final body = <String, dynamic>{
            "username": login,
            "password": password,
            "passwordConfirm": password
          };
          final pb = context.read<PocketBase>();

          await pb.collection('users').create(body: body);
          await pb.collection('users').authWithPassword(login, password);

          if (context.mounted) {
            context.go('/');
          }
        },
        buttonChild: const Text('Sign up'),
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Credentials(
              onSubmit: (login, password) async {
                await context
                    .read<PocketBase>()
                    .collection('users')
                    .authWithPassword(login, password);
                if (context.mounted) {
                  context.go('/');
                }
              },
              buttonChild: const Text("Login"),
            ),
            TextButton(
                onPressed: () {
                  context.go('/sign_up');
                },
                child: const Text('Sign up'))
          ],
        ),
      ),
    );
  }
}

class TicketsListPage extends StatefulWidget {
  const TicketsListPage({super.key});

  @override
  State<TicketsListPage> createState() => _TicketsListPageState();
}

class _TicketsListPageState extends State<TicketsListPage> {
  var tickets = <RecordModel>[];

  Future<List<RecordModel>> _getTickets(BuildContext context) async {
    return context.read<PocketBase>().collection('tickets').getFullList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getTickets(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          tickets = snapshot.data!;
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.go('/tickets/create');
              },
              child: const Icon(Icons.add),
            ),
            body: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final currentTicket = tickets[index];
                return ListTile(
                  title: Text(currentTicket.data["title"]),
                  onTap: () {
                    context.go('/tickets/${currentTicket.id}');
                  },
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class TicketDetailPage extends StatefulWidget {
  const TicketDetailPage({required this.ticketId, super.key});

  final String ticketId;

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  late Future<RecordModel> _futureTicket;

  @override
  void initState() {
    super.initState();
    _futureTicket = _fetchTicket();
  }

  Future<RecordModel> _fetchTicket() async {
    return await context
        .read<PocketBase>()
        .collection('tickets')
        .getOne(widget.ticketId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureTicket,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final currentTicket = snapshot.data!;
            return Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                        onPressed: () {
                          context.go('/tickets/${currentTicket.id}/edit');
                        },
                        icon: const Icon(Icons.edit))
                  ],
                ),
                body: Column(
                  children: [
                    Text(currentTicket.id),
                    Text(currentTicket.data["title"]),
                    Text(currentTicket.data["content"]),
                  ],
                ));
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

class TicketCreatePage extends StatefulWidget {
  const TicketCreatePage({super.key});

  @override
  State<TicketCreatePage> createState() => _TicketCreatePageState();
}

class _TicketCreatePageState extends State<TicketCreatePage> {
  final _titleController = TextEditingController();
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
                controller: _titleController,
              ),
              TextFormField(
                controller: _contentController,
              ),
              OutlinedButton(
                  onPressed: () async {
                    final Map<String, dynamic> body = {
                      "title": _titleController.text,
                      "content": _contentController.text
                    };
                    await context
                        .read<PocketBase>()
                        .collection('tickets')
                        .create(body: body);

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

class TicketEditPage extends StatefulWidget {
  const TicketEditPage({required this.ticketId, super.key});

  final String ticketId;

  @override
  State<TicketEditPage> createState() => _TicketEditPageState();
}

class _TicketEditPageState extends State<TicketEditPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  late Future<RecordModel> _ticketFuture;

  Future<RecordModel> _getTicket() {
    return context
        .read<PocketBase>()
        .collection('tickets')
        .getOne(widget.ticketId);
  }

  @override
  void initState() {
    super.initState();

    _ticketFuture = _getTicket();
  }

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _ticketFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final ticket = snapshot.data!;
          _titleController.text = ticket.data["title"];
          _contentController.text = ticket.data["content"];
          return Scaffold(
            body: Form(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _titleController,
                    ),
                    TextFormField(
                      controller: _contentController,
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          final Map<String, dynamic> body = {
                            "title": _titleController.text,
                            "content": _contentController.text
                          };
                          await context
                              .read<PocketBase>()
                              .collection('tickets')
                              .update(ticket.id, body: body);

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
