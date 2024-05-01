import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_1/src/features/auth/pocketbase_data_source.dart';
import 'package:flutter_pocketbase_1/src/features/auth/ui/sign_in_page.dart';
import 'package:flutter_pocketbase_1/src/features/auth/ui/sign_up_page.dart';
import 'package:flutter_pocketbase_1/src/features/auth/view_model.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/pocketbase_data_source.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/view_model.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/ui/ticket_create_page.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/ui/ticket_detail_page.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/ui/ticket_edit_page.dart';
import 'package:flutter_pocketbase_1/src/features/tickets/ui/ticket_list_page.dart';
import 'package:flutter_pocketbase_1/theme.dart';
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
    ChangeNotifierProxyProvider<PocketBase, AuthViewModel>(
      create: (context) {
        return AuthViewModel(
            dataSource:
                AuthPocketbaseDataSource(pb: context.read<PocketBase>()));
      },
      update: (context, value, previous) {
        return AuthViewModel(dataSource: AuthPocketbaseDataSource(pb: value));
      },
    )
  ], child: const PocketBaseApp()));
}

class PocketBaseApp extends StatelessWidget {
  const PocketBaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      routerConfig: _router,
    );
  }
}
