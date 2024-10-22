import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_feed_app/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  // ignore: prefer_typing_uninitialized_variables
  final userBox;
  LoginCubit(this.userBox) : super(LoginInitial());

  void login(Map<String, dynamic> textFormFields) {
    emit(LoginInitial());

    try {
      // Extract username and password from the form fields
      final username = textFormFields['username'];
      final password = textFormFields['password'];

      try {
        // Check if the user exists in the userBox
        var user = userBox.values.toList().firstWhere(
              (user) => user.username == username,
            );

        // Check if the password matches
        if (user.password == password) {
          // Proceed with the login logic
          emit(LoginSuccess(user));
        } else {
          // Handle invalid password
          emit(LoginError("Invalid password."));
        }
      } catch (e) {
        // Handle user not found
        emit(LoginError("User not found."));
      }
    } catch (e) {
      // Handle error
      emit(LoginError("An error occurred while logging in."));
    }
  }
}
