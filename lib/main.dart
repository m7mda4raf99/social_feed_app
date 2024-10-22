import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:social_feed_app/models/user_model.dart';
import 'package:social_feed_app/services/router_service.dart';

void main() async {
  // Initialize Hive and Hive Flutter
  await Hive.initFlutter();

  // Register User adapter
  Hive.registerAdapter(UserAdapter());

  // Open a Hive box for storing users
  await Hive.openBox<User>('users');

  var userBox = Hive.box<User>('users');

  print(userBox);

  List<User> allUsers = userBox.values.toList();

  // print(allUsers);

  print(allUsers[0].username);
  print(allUsers[1].username);
  print("ashraf");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Feed App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: RouterService.routes,
    );
  }
}
