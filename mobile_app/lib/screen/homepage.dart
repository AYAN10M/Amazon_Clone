import 'package:flutter/material.dart';
import 'package:mobile_app/components/reusable_components/homepage_custom_appbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageCustomAppBar(),
      body: const Center(child: Text("Main content here")),
    );
  }
}
