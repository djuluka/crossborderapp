import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Dashboard",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
