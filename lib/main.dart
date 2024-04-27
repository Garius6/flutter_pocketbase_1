import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pocketbase_1/widgets/credentials.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [Provider(create: (_) => PocketBase("http://10.0.2.2:8090"))],
      child: const PocketBaseApp()));
}

class PocketBaseApp extends StatelessWidget {
  const PocketBaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
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
          await context
              .read<PocketBase>()
              .collection('users')
              .create(body: body);
        },
        buttonChild: const Text('Sign up'),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Credentials(
        onSubmit: (login, password) async {
          context
              .read<PocketBase>()
              .collection('users')
              .authWithPassword(login, password);
        },
        buttonChild: const Text("Login"),
      ),
    );
  }
}
