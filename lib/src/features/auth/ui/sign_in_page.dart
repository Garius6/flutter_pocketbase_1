import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_1/src/features/auth/ui/widgets/credentials.dart';
import 'package:flutter_pocketbase_1/src/features/auth/view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
              onSubmit: (username, password) async {
                await context.read<AuthViewModel>().signIn(username, password);

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
