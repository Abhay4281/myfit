import 'dashboard.dart';
import 'package:flutter/material.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Sport Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the Sport Screen!'),
      ),
    );
  }
}
