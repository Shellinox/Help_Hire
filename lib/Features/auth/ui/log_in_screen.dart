import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_hive/Features/auth/bloc/auth_bloc.dart';
import 'package:help_hive/Features/auth/ui/sign_up_screen.dart';
import 'package:help_hive/Features/home/ui/home_screen.dart';
import 'package:help_hive/Utils/colors.dart';
import 'package:help_hive/Widgets/custom_button.dart';
import 'package:help_hive/Widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = AuthBloc();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocConsumer<AuthBloc, AuthState>(
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
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
                (route) => false);
          }
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route)=> false
            );
          }
        },
        bloc: authBloc,
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
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
                      controller: emailController,
                      hintText: "Email",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextfield(
                      controller: passwordController,
                      hintText: "Password",
                      isObsecureText: true
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        buttonTitle: "Log in",
                        onPressed: () {
                          authBloc.add(
                            AuthLogInRequestedEvent(
                              email: emailController.text.trim(),
                              password: passwordController.text..trim(),
                            ),
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: primaryTextColor),
                        ),
                        TextButton(
                          onPressed: () {
                            authBloc.add(
                              LoginPageSignUpButtonClickedEvent(),
                            );
                          },
                          child: const Text(
                            "Sign up",
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
        });
  }
}
