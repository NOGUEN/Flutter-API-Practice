import 'package:flutter/material.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return loginHomeScaffold();
  }
}

Widget loginHomeScaffold() {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Login API Practice'),
      centerTitle: false,
    ),
    body: loginHomeColumn(),
  );
}

Widget loginHomeColumn() {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
    child: Column(
      children: [
        const Text(
          'login page',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        customTextField(idController, 'ID'),
        customTextField(passwordController, 'Password'),
      ],
    ),
  );
}

Widget customTextField(
  TextEditingController controller,
  String textForHint,
) {
  return TextField(
    controller: controller,
    onSubmitted: tapPasswordTextField,
    onChanged: checkIdTextField,
    decoration: InputDecoration(
      hintText: textForHint,
      border: const OutlineInputBorder(),
    ),
  );
}

void tapPasswordTextField(string) {}
void checkIdTextField(string) {}
void checkInfo(string) {}
void checkPasswordTextField(string) {}
