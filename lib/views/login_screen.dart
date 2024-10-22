import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_feed_app/controllers/login_cubit/login_cubit.dart';
import 'package:social_feed_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  List<Map<String, dynamic>> textFormFields = [
    {
      "name": "Username",
      "controller": TextEditingController(),
      "focusNode": FocusNode(),
      "key": GlobalKey<FormFieldState>(),
      "type": TextInputType.text
    },
    {
      "name": "Password",
      "controller": TextEditingController(),
      "focusNode": FocusNode(),
      "key": GlobalKey<FormFieldState>(),
      "type": TextInputType.visiblePassword
    },
  ];

  LoginCubit? loginCubit;

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < textFormFields.length - 1; i++) {
      textFormFields[i]["next"] = textFormFields[i + 1]["focusNode"];
    }

    loginCubit = BlocProvider.of<LoginCubit>(context);

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 128),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome! Let's get started by logging in. \nPlease fill out the following fields",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF777777),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    for (var textFormField in textFormFields)
                      Column(
                        children: [
                          CustomTextField(field: textFormField),
                          const SizedBox(height: 20)
                        ],
                      ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        if (textFormFields.every((element) =>
                            element["key"].currentState!.validate())) {
                          loginCubit?.login({
                            "username": textFormFields[0]["controller"].text,
                            "password": textFormFields[1]["controller"].text
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 12),
                          backgroundColor: const Color(0xFF161747),
                          foregroundColor: Colors.white),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
