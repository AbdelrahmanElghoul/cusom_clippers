import 'package:flutter/material.dart';
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
            clipper: FrequencyClipper(count: 3, startPoint: .5),
            child: Container(
              height: 300,
              width: double.maxFinite,
              alignment: Alignment.center,
              color: Colors.amber.shade800,
              child: const Text("test"),
            ),
          ),
        ),
      ),
    );
  }
}
