import 'package:app/views/group/group.dart';
import 'package:app/views/home/home.dart';
import 'package:app/views/login/login.dart';
import 'package:app/views/new_gateway/new_gateway.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: Login.routeName,
        routes: {
          Login.routeName: (context) => const Login(),
          Home.routeName: (context) => const Home(),
          Group.routeName: (context) => const Group(),
          NewGateway.routeName: (context) => const NewGateway(),
        },
        builder: (context, child) => SafeArea(child: child!));
  }
}
