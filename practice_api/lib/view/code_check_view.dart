import 'package:flutter/material.dart';
import 'package:practice_api/controller/login_controller.dart';
import 'package:practice_api/view/home_view.dart';
import 'package:practice_api/services/user_service.dart';

import 'package:get/get.dart';

class CodeCheckView extends StatefulWidget {
  CodeCheckView({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<CodeCheckView> createState() => _CodeCheckViewState();
}

class _CodeCheckViewState extends State<CodeCheckView> {
  final TextEditingController codeCheckController = TextEditingController();

  final LoginController loginController = Get.find<LoginController>();

  bool showSignUpModal = false;

  bool termsCheck = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet:
            showSignUpModal ? termAcceptBottomSheet() : const SizedBox.shrink(),
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
                bool verified = false;
                bool signedUp = false;

                if (codeCheckController.text.isNotEmpty &&
                    codeCheckController.text.length == 6) {
                  verified = await loginController.checkCode(
                    phoneNumber: widget.phoneNumber,
                    code: codeCheckController.text,
                  );
                } else {
                  Get.snackbar("인증번호 확인", "인증번호 형식이 잘못되었습니다.");
                }
                if (verified) {
                  signedUp = await loginController.checkSignedUp(
                    phoneNumber: widget.phoneNumber,
                  );
                }
                if (signedUp) {
                  Get.off(HomeView());
                } else {
                  setState(() {
                    showSignUpModal = true;
                  });
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

  Widget termAcceptBottomSheet() {
    return BottomSheet(
      elevation: 5.0,
      enableDrag: false,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      onClosing: () {},
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return ListView(
                controller: scrollController,
                children: [
                  Text(
                    "서비스 동의",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        termsCheck = !termsCheck;
                      });
                    },
                    child: checkBtn(
                      context,
                      "이용약관",
                      termsCheck,
                    ),
                  ),
                  _ContainedButton(
                    "동의하고 가입하기",
                    onTap: () async {
                      bool signUpResult = false;

                      if (termsCheck) {
                        signUpResult = await loginController.signUp(
                            phoneNumber: widget.phoneNumber,
                            code: codeCheckController.text);
                      }
                      if (signUpResult) {
                        Get.off(HomeView());
                      }
                    },
                    buttonColor: termsCheck ? Colors.blue : Colors.grey,
                    textColor: Colors.white,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget checkBtn(
    BuildContext context,
    String title,
    bool clickedBtn,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        children: [
          Icon(
            Icons.check,
            size: 14,
            color: clickedBtn ? Colors.blue : Colors.grey,
          ),
          SizedBox(width: 20),
          Text(
            "[필수] $title",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContainedButton extends StatelessWidget {
  const _ContainedButton(
    this.text, {
    Key? key,
    required this.onTap,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  final void Function() onTap;
  final String text;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: textColor,
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
