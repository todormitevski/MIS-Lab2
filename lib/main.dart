import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/jokes_by_type_screen.dart';
import 'screens/random_joke_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joker',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/jokesByType': (context) {
          final type = ModalRoute.of(context)!.settings.arguments as String;
          return JokesByTypeScreen(type: type);
        },
        '/randomJoke': (context) => const RandomJokeScreen(),
      },
    );
  }
}
