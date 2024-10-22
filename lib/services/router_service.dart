import 'package:social_feed_app/views/home_screen.dart';
import 'package:social_feed_app/views/login_screen.dart';
import 'package:social_feed_app/views/splash_screen.dart';

class RouterService {
  static final routes = {
    '/': (context) => const SplashScreen(),
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
  };
}
