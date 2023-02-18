// ignore_for_file: use_key_in_widget_constructors

import 'package:dementia/models/model_auth.dart';
import 'package:dementia/models/model_register.dart';
import 'package:dementia/view/register/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('회원가입'),
          elevation: 0,
        ),
        body: Column(
          children: [
            EmailInput(),
            PasswordInput(),
            PasswordConfirmInput(),
            RegistButton()
          ],
        ),
      ),
    );
  }
}


class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final register = Provider.of<RegisterModel>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(5),
      child: TextField(
        onChanged: (email) {
          register.setEmail(email);
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: '이메일',
          //helperText: 'abcd@naver.com',
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final register = Provider.of<RegisterModel>(context);
    return Container(
      padding: const EdgeInsets.all(5),
      child: TextField(
        onChanged: (password) {
          register.setPassword(password);
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: '비밀번호',
          helperText: '',
          errorText: register.password != register.passwordConfirm
              ? '비밀번호가 같지 않습니다.'
              : null,
        ),
      ),
    );
  }
}

class PasswordConfirmInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final register = Provider.of<RegisterModel>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(5),
      child: TextField(
        onChanged: (password) {
          register.setPasswordConfirm(password);
        },
        obscureText: true,
        decoration: const InputDecoration(
          labelText: '비밀번호를 다시 입력하세요.',
          helperText: '',
        ),
      ),
    );
  }
}

class RegistButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    final register = Provider.of<RegisterModel>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: (register.password != register.passwordConfirm)
            ? null
            : () async {
                await authClient
                    .registerWithEmail(register.email, register.password)
                    .then((registerStatus) {
                  if (registerStatus == AuthStatus.registerSuccess) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(content: Text('회원가입을 완료하였습니다.')),
                      );
                    Get.off(const LoginPage());
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(content: Text('이메일과 비밀번호가 맞는지 다시 확인해주세요.')),
                      );
                  }
                });
              },
        child: const Text('회원가입'),
      ),
    );
  }
}
