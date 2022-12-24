import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/login_home.dart';

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
