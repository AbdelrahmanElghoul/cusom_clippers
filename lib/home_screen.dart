import 'package:custom_clipper/custom_clippers/arc_clipper.dart';
import 'package:flutter/material.dart';
import 'custom_clippers/arrow_clipper.dart';
import 'custom_clippers/frequency_clipper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("custom clipper"),
      ),
      backgroundColor: Colors.red.shade50,
      body: Center(
        child: Container(
          color: Colors.blue.shade100,
          child: ClipPath(
            clipper: FrequencyClipper(),
            child: Container(
              height: 100,
              width: 200,
              color: Colors.amber.shade800,
              child: Text("test"),
            ),
          ),
        ),
      ),
    );
  }
}
