import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/provider/palindrome.dart';
import 'package:suitmedia_test/provider/user_data.dart';
import 'package:suitmedia_test/first_screen.dart';
import 'package:suitmedia_test/provider/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => Palindrome()),
        ChangeNotifierProvider(create: (_) => UserData()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FirstScreen(),
    );
  }
}
