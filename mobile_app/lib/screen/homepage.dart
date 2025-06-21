import 'package:flutter/material.dart';
import 'package:mobile_app/components/reusable_components/custom_appbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const Center(child: Text("Main content here")),
    );
  }
}
