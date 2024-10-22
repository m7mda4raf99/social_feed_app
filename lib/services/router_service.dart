import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:social_feed_app/controllers/login_cubit/login_cubit.dart';
import 'package:social_feed_app/models/user_model.dart';
import 'package:social_feed_app/views/home_screen.dart';
import 'package:social_feed_app/views/login_screen.dart';
import 'package:social_feed_app/views/splash_screen.dart';

class RouterService {
  static final userBox = Hive.box<User>('users');

  static final routes = {
    // '/': (context) => const SplashScreen(),
    '/': (context) => BlocProvider(
          create: (context) => LoginCubit(userBox),
          child: LoginScreen(),
        ),
    // '/login': (context) => LoginScreen(),
    '/home': (context) => const HomeScreen(),
  };
}
