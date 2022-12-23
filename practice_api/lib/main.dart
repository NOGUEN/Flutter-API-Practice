import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const PracticeAPI());
}

class PracticeAPI extends StatelessWidget {
  const PracticeAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Login Feature',
      home: LoginHome(),
    );
  }
}

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
