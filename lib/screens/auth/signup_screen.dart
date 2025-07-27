import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/providers/auth_provider.dart';
import 'package:recipe_app/theme/app_text_theme.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/widgets/custom_scaffold.dart';
import 'package:recipe_app/widgets/error_snackbar.dart';
import 'package:recipe_app/widgets/input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  void _validateAndSignup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).signup(email, password);
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/tabs');
      }
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(
          context,
          'Signup failed: ${e.toString()}',
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          decoration: BoxDecoration(
            color: ColorScheme.of(context).onSecondary.withAlpha(50),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: [
                Text('Sign Up', style: AppTextTheme.textTheme.displayLarge),
                InputField(
                  label: 'Email',
                  icon: Icon(Icons.mail),
                  controller: _emailController,
                ),
                InputField(
                  label: 'Password',
                  isPassword: true,
                  icon: Icon(Icons.remove_red_eye),
                  controller: _passwordController,
                ),

                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Text(
                    'A registered user',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: const Color.fromARGB(104, 255, 255, 255),
                    ),
                  ),
                ),

                _isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: 'Sign Up',
                        onPressed: _validateAndSignup,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
