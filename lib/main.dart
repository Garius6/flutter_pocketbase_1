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
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const Placeholder();
        },
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
                  print('pressed');
                  context.go('/sign_up');
                  print('after pressed');
                },
                child: const Text('Sign up'))
          ],
        ),
      ),
    );
  }
}
