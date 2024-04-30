import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/pocketbase_data_source.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/view_model.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/ui/ticket_create_page.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/ui/ticket_detail_page.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/ui/ticket_edit_page.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/ui/ticket_list_page.dart';
import 'package:flutter_pocketbase_1/theme.dart';
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
    debugLogDiagnostics: kDebugMode,
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

void main() async {
  runApp(MultiProvider(providers: [
    Provider(create: (_) => PocketBase("http://10.0.2.2:8090")),
    ChangeNotifierProxyProvider<PocketBase, TicketsViewModel>(
      create: (context) {
        return TicketsViewModel(
            TicketsPocketbaseDataSource(pb: context.read<PocketBase>()));
      },
      update: (context, value, previous) {
        return TicketsViewModel(TicketsPocketbaseDataSource(pb: value));
      },
    ),
  ], child: const PocketBaseApp()));
}

class PocketBaseApp extends StatelessWidget {
  const PocketBaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      theme: ThemeData.from(
          colorScheme: MaterialTheme.lightScheme().toColorScheme()),
      darkTheme: ThemeData.from(
          colorScheme: MaterialTheme.darkScheme().toColorScheme()),
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
