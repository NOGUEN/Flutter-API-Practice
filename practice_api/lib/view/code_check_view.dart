import 'package:flutter/material.dart';
import 'package:practice_api/controller/login_controller.dart';
import 'package:practice_api/view/home_view.dart';

import 'package:get/get.dart';

class CodeCheckView extends StatelessWidget {
  CodeCheckView({super.key, required this.phoneNumber});

  final TextEditingController codeCheckController = TextEditingController();
  final LoginController loginController = Get.find<LoginController>();

  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: codeCheckController,
              onSubmitted: fff,
              onChanged: ttt,
              decoration: const InputDecoration(
                hintText: '인증번호를 입력하세요.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final bool result = await loginController.checkCode(
                  phoneNumber: phoneNumber,
                  code: codeCheckController.text,
                );
                print(codeCheckController.text);
                if (result) {
                  Get.off(const HomeView());
                } else {
                  Get.snackbar("Error", "Authentication Failed");
                }
              },
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
      ),
    );
  }
}

void fff(string) {}
void ttt(string) {}
