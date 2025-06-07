import 'package:flutter/material.dart';
import 'package:mobile_app/components/reusable_components/language_button.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.language, size: 30, color: Colors.blueGrey),
                  SizedBox(width: 10),
                  Text(
                    'Choose Your Language',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLanguageButton(
                    text: 'English',
                    onPressed: () {},
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 15),
                  CustomLanguageButton(
                    text: 'Spanish',
                    onPressed: () {},
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLanguageButton(
                    text: 'French',
                    onPressed: () {},
                    color: Colors.red,
                  ),
                  const SizedBox(width: 15),
                  CustomLanguageButton(
                    text: 'German',
                    onPressed: () {},
                    color: Colors.orange,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLanguageButton(
                    text: 'Chinese',
                    onPressed: () {},
                    color: Colors.purple,
                  ),
                  const SizedBox(width: 15),
                  CustomLanguageButton(
                    text: 'Japanese',
                    onPressed: () {},
                    color: Colors.teal,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLanguageButton(
                    text: 'Hindi',
                    onPressed: () {},
                    color: Colors.brown,
                  ),
                  const SizedBox(width: 15),
                  CustomLanguageButton(
                    text: 'Arabic',
                    onPressed: () {},
                    color: Colors.cyan,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
