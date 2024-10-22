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

  print(allUsers);

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    var userBox = Hive.box<User>('users');

    // Create a new user instance
    // var newUser = User(
    //   id: '1',
    // username: 'm7mdaraf99',
    // password: 'password123', // Store passwords securely in real applications
    // profileImageUrl: 'https://example.com/profile.jpg',
    // );

    // var newUser = await User.create(
    //   username: 'm7mdaraf99',
    //   password: 'password123', // Store passwords securely in real applications
    //   profileImageUrl: 'https://example.com/profile.jpg',
    // );

    // // // Store the user in the box
    // userBox.put(newUser.id, newUser);

    print(userBox);

    List<User> allUsers = userBox.values.toList();

    print(allUsers[1].id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
