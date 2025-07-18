import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage>
    with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late AnimationController _fadeInController;

  @override
  void initState() {
    super.initState();
    _fadeInController = AnimationController(
      duration: const Duration(milliseconds: 550),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    _fadeInController.dispose();
    super.dispose();
  }

  String? _validateInput(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email or mobile number';
    }
    final input = value.trim();
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final phoneRegex = RegExp(r'^\+?[\d\s-()]{10,}$');
    if (!emailRegex.hasMatch(input) && !phoneRegex.hasMatch(input)) {
      return 'Invalid email or mobile number';
    }
    return null;
  }

  Future<void> _handleContinue() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: FadeTransition(
            opacity: _fadeInController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Lottie.asset('assets/animations/lottie/Login.json'),
                ),

                const Text(
                  'Sign in or create account',
                  style: TextStyle(
                    fontFamily: 'Goldman',
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // Form
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _handleContinue(),
                    validator: _validateInput,
                    decoration: InputDecoration(
                      hintText: 'Email or mobile number',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF23242A),
                      contentPadding: const EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.grey.shade800),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.grey.shade700),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.grey[500],
                      ),
                      suffixIcon: ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _emailController,
                        builder: (context, value, child) {
                          return value.text.isNotEmpty
                              ? IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey[400],
                                  ),
                                  onPressed: () => _emailController.clear(),
                                  tooltip: 'Clear',
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[400],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      disabledBackgroundColor: Colors.grey[700],
                      elevation: 1,
                      textStyle: const TextStyle(
                        fontFamily: 'Goldman',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.black,
                              ),
                            ),
                          )
                        : const Text('Continue'),
                  ),
                ),

                // Spacer for links
                const SizedBox(height: 33),

                // Agreement text (no links here)
                const Text(
                  "By continuing, you agree to Amazon's",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: 'Goldman',
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 14),

                _buildFooterLinks(),

                // Spacer before copyright
                const SizedBox(height: 18),
                Text(
                  '© 1996–2025, Amazon.com, Inc. or its affiliates',
                  style: TextStyle(
                    fontSize: 10.5,
                    color: Colors.grey[700],
                    fontFamily: 'Goldman',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterLinks() {
    return Column(
      children: [
        Center(child: _buildLink('Conditions of Use')),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLink('Privacy Notice'),
            _dotDivider(),
            _buildLink('Help'),
          ],
        ),
      ],
    );
  }

  Widget _buildLink(String text) => InkWell(
    onTap: () => _showInfoDialog(text, '$text information...'),
    borderRadius: BorderRadius.circular(3),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 12.5,
          fontFamily: 'Goldman',
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );

  Widget _dotDivider() => const Text(
    ' | ',
    style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.1),
  );

  void _showInfoDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF23242A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(content, style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: TextStyle(color: Color(0xFFFFC107))),
          ),
        ],
      ),
    );
  }
}
