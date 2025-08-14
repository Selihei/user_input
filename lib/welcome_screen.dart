import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;

  const WelcomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Willkommen")),
      body: Center(
        child: Text(
          'Willkommen, $username!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
