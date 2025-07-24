import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/providers/auth_provider.dart';
import 'package:recipe_app/theme/app_text_theme.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/widgets/custom_scaffold.dart';
import 'package:recipe_app/widgets/error_snackbar.dart';
import 'package:recipe_app/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  void _validateAndLogin() async {
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
      ).login(email, password);
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(context, 'Login failed: ${e.toString()}');
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
                Text('Login', style: AppTextTheme.textTheme.displayLarge),
                InputField(
                  label: 'Email',
                  icon: Icon(Icons.mail),
                  controller: _emailController,
                ),
                InputField(
                  label: 'Password',
                  icon: Icon(Icons.remove_red_eye),
                  isPassword: true,
                  controller: _passwordController,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: ColorScheme.of(context).onSurface,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  child: Text(
                    'Not a registered user',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: const Color.fromARGB(104, 255, 255, 255),
                    ),
                  ),
                ),

                _isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(text: 'Login', onPressed: _validateAndLogin),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
