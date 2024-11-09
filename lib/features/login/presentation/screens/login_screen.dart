import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/consts/assets.dart';
import 'package:todo/core/consts/error_messages.dart';
import 'package:todo/core/helpers/snackbars.dart';
import 'package:todo/core/theme/styles.dart';
import 'package:todo/features/loading/presentation/screens/loading_screen.dart';
import 'package:todo/features/login/presentation/providers/auth_provider.dart';
import 'package:todo/features/login/presentation/widgets/buttons/main_button.dart';
import 'package:todo/features/login/presentation/widgets/text_fields/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({super.key});
  static const String route = '/login';
  static const String name = 'login';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingScreen() : Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Image.asset(Assets.login, height: 100,),
            ),
            Text('LOGIN', style: textTitle,),
            const SizedBox(height: 20,),
            Text('TO DO LIST - KAMBDA', style: textSubtitle,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomTextField(
                  label: 'Email',
                  controller: emailController,
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  keyboardType: TextInputType.text),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: MainButton(onPressed: login, child: Text('LOGIN', style: textButton,)),
            ),
          ],
        ),
      )
    );
  }

  Future<void> login() async {
    if(emailController.text.isEmpty) {
      SnackBars.showSnackBar(context, 'Email is required');
    } else if(passwordController.text.isEmpty) {
      SnackBars.showSnackBar(context, 'Password is required');
    } else {
      setState(() {
        isLoading = true;
      });
      try {
        await ref.read(authProvider).signIn(
          emailController.text,
          passwordController.text,
        );
      } catch (e) {
        Map<String, String> errorMessagesInSpanish = {
          'invalid-email': invalidEmailError,
          'user-disabled': userDisabledError,
          'user-not-found': userNotFoundError,
          'wrong-password': wrongPasswordError,
        };
        setState(() {
          isLoading = false;
        });
        String getErrorMessage(FirebaseAuthException e) {
          return errorMessagesInSpanish[e.code] ?? defaultErrorText;
        }
        String message = defaultErrorText;
        if (e is FirebaseAuthException) {
          message = getErrorMessage(e);
        }
        SnackBars.showSnackBar(context, message);
      }
    }
  }
}
