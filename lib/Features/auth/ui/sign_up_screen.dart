import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_hive/Features/auth/bloc/auth_bloc.dart';
import 'package:help_hive/Features/auth/ui/log_in_screen.dart';
import 'package:help_hive/Features/home/ui/home_screen.dart';
import 'package:help_hive/Utils/colors.dart';
import 'package:help_hive/Widgets/custom_button.dart';
import 'package:help_hive/Widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final AuthBloc authBloc = AuthBloc();
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
        if (state is AuthAction) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        }
        if (state is AuthSuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/appLogo.png",
                    scale: 3,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  CustomTextfield(
                    controller: nameController,
                    hintText: "Name",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    controller: passwordController,
                    hintText: "Password",
                    isObsecureText: true, 
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    controller: confirmPasswordController,
                    hintText: "Confirm password",
                    isObsecureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    buttonTitle: "Sign up",
                    onPressed: () {
                      authBloc.add(
                        AuthSignUpEvent(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          confirmPassword:
                              confirmPasswordController.text.trim(),
                          name: nameController.text.trim(),
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: primaryTextColor),
                      ),
                      TextButton(
                        onPressed: () {
                          authBloc.add(SignUpPageLoginButtonClickedEvent());
                        },
                        child: const Text(
                          "Log in",
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
