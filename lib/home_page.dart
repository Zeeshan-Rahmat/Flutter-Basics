import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basics'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'First Day of Flutter',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
