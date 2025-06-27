import 'package:flutter/material.dart';
import 'package:mobile_app/components/reusable_components/custom_button.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String selectedLanguage = 'English';

  final List<String> languages = [
    'English',
    'हिंदी',
    'தமிழ்',
    'తెలుగు',
    'മലയാളം',
    'ಕನ್ನಡ',
    'मराठी',
    'বাংলা',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.language, size: 30, color: Colors.blueGrey),
                  SizedBox(width: 10),
                  Text(
                    'Choose your language',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Language options in a responsive layout
              Center(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: languages
                      .map(
                        (lang) => CustomButton(
                          text: lang,
                          isSelected: selectedLanguage == lang,
                          onPressed: () {
                            setState(() {
                              selectedLanguage = lang;
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              const Spacer(),
              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/welcome');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[400],
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Continue in $selectedLanguage',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
