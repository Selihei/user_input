import 'package:flutter/material.dart';
import 'package:user_input/welcome_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _correctUsername = 'RainerZ';
  final String _correctPassword = 'random1';

  bool _usernameHasError = false;
  bool _passwordHasError = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _checkLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    setState(() {
      _usernameHasError = username != _correctUsername;
      _passwordHasError = password != _correctPassword;
    });

    if (!_usernameHasError && !_passwordHasError) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(username: username),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Username'),
              const SizedBox(height: 8),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorText: _usernameHasError ? "Falscher Username" : null,
                ),
              ),
              const SizedBox(height: 16),
              const Text("Password"),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorText: _passwordHasError ? "Falsches Passwort" : null,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkLogin,
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
