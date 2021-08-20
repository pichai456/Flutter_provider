import 'package:flutter/material.dart';
import 'package:lab_10_provider/add_user.dart';
import 'package:lab_10_provider/user.dart';
import 'package:lab_10_provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return UserProvider();
          },
        )
      ],
      child: MaterialApp(
          title: 'SQFlite Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => BookPage(),
            '/adduser': (context) => AddBookPage(),
          }),
    );
  }
}
