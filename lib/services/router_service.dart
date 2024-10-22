import 'package:social_feed_app/main.dart';
import 'package:social_feed_app/views/home_screen.dart';
import 'package:social_feed_app/views/login_screen.dart';

class RouterService {
  static final routes = {
    '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
  };
}
