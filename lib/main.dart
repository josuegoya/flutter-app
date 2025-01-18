import 'package:crud_users/pages/register_users.dart';
import 'package:crud_users/pages/users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Users.ROUTE,
      routes: {
        Users.ROUTE: (_) => Users(),
        RegisterUsers.ROUTE: (_) => RegisterUsers()
      },
    );
  }
}
