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
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your language',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Goldman',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),

              // Language selection grid
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
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Continue in $selectedLanguage',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Goldman',
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
