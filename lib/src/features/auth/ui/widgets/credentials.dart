import 'package:flutter/material.dart';

class Credentials extends StatefulWidget {
  const Credentials(
      {required this.buttonChild, required this.onSubmit, super.key});

  final void Function(String login, String password) onSubmit;
  final Widget? buttonChild;

  @override
  State<Credentials> createState() => _CredentialsState();
}

class _CredentialsState extends State<Credentials> {
  final _formKey = GlobalKey<FormState>();
  final _loginFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _loginFieldController,
            ),
            TextFormField(
              controller: _passwordFieldController,
            ),
            OutlinedButton(
                onPressed: () {
                  widget.onSubmit(_loginFieldController.text,
                      _passwordFieldController.text);
                },
                child: widget.buttonChild)
          ],
        ),
      ),
    );
  }
}
