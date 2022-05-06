import 'package:flutter/material.dart';
import 'custom_clippers/arc_clipper.dart';

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
            clipper: ArcClipper(hPadding: 0),
            child: Container(
              height: 300,
              width: 300,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
