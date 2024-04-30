import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_1/src/features/auth/ui/widgets/credentials.dart';
import 'package:flutter_pocketbase_1/src/features/auth/view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
        onSubmit: (username, password) async {
          await context.read<AuthViewModel>().signUp(username, password);

          if (context.mounted) {
            context.go('/');
          }
        },
        buttonChild: const Text('Sign up'),
      ),
    );
  }
}
