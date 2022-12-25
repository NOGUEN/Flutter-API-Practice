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
  final TextEditingController phoneNumberController = TextEditingController();

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
        phoneNumberTextField(phoneNumberController),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.blue,
            ),
            child: const Center(
              child: Text('인증하기'),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget phoneNumberTextField(TextEditingController controller) {
  return TextField(
    controller: controller,
    onSubmitted: tapPasswordTextField,
    onChanged: checkIdTextField,
    decoration: const InputDecoration(
      hintText: '휴대폰 번호를 입력하세요.',
      border: OutlineInputBorder(),
    ),
  );
}

void tapPasswordTextField(string) {}
void checkIdTextField(string) {}
void checkInfo(string) {}
void checkPasswordTextField(string) {}
