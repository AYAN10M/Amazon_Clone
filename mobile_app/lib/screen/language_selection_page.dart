import 'package:flutter/material.dart';
import 'package:mobile_app/components/reusable_components/custom_button.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String selectedLanguage = 'English'; // Track selected language

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
                    'Choose your language',
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
                  CustomButton(
                    text: 'English',
                    isSelected:
                        selectedLanguage == 'English', // Check if selected
                    onPressed: () {
                      setState(() {
                        selectedLanguage = 'English'; // Update selection
                      });
                    },
                  ),
                  const SizedBox(width: 15),
                  CustomButton(
                    text: 'हिंदी',
                    isSelected: selectedLanguage == 'हिंदी',
                    onPressed: () {
                      setState(() {
                        selectedLanguage = 'हिंदी';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'தமிழ்',
                    isSelected: selectedLanguage == 'தமிழ்',
                    onPressed: () {
                      setState(() {
                        selectedLanguage = 'தமிழ்';
                      });
                    },
                  ),
                  const SizedBox(width: 15),
                  CustomButton(
                    text: 'తెలుగు',
                    isSelected: selectedLanguage == 'తెలుగు',
                    onPressed: () {
                      setState(() {
                        selectedLanguage = 'తెలుగు';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'മലയാളം',
                    isSelected: selectedLanguage == 'മലയാളം',
                    onPressed: () {
                      setState(() {
                        selectedLanguage = 'മലയാളം';
                      });
                    },
                  ),
                  const SizedBox(width: 15),
                  CustomButton(
                    text: 'ಕನ್ನಡ',
                    isSelected: selectedLanguage == 'ಕನ್ನಡ',
                    onPressed: () {
                      setState(() {
                        selectedLanguage = 'ಕನ್ನಡ';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'मराठी',
                    isSelected: selectedLanguage == 'मराठी',
                    onPressed: () {
                      setState(() {
                        selectedLanguage = 'मराठी';
                      });
                    },
                  ),
                  const SizedBox(width: 15),
                  CustomButton(
                    text: 'বাংলা',
                    isSelected: selectedLanguage == 'বাংলা',
                    onPressed: () {
                      setState(() {
                        selectedLanguage = 'বাংলা';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle continue action
                    Navigator.pushNamed(
                      context,
                      '/welcome',
                    ); // Navigate to welcome screen
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
