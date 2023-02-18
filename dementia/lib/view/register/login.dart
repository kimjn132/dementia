import 'package:dementia/models/model_auth.dart';
import 'package:dementia/models/model_login.dart';
import 'package:dementia/tab.dart';
import 'package:dementia/view/register/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginModel(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('로그인'),
            elevation: 0,
          ),
          body: Column(
            children: const [
              EmailInput(),
              PasswordInput(),
              LoginButton(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Divider(
                  thickness: 1,
                ),
              ),
              RegisterButton(),
            ],
          ),
        ));
  }
}


class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginModel>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: (email) {
          login.setEmail(email);
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: '이메일',
          helperText: '',
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginModel>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: (password) {
          login.setPassword(password);
        },
        obscureText: true,
        decoration: const InputDecoration(
          labelText: '비밀번호',
          helperText: '',
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    final login = Provider.of<LoginModel>(context, listen: false);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(30.0),
        //   ),
        // ),
        onPressed: () async {
          await authClient
              .loginWithEmail(login.email, login.password)
              .then((loginStatus) {
            if (loginStatus == AuthStatus.loginSuccess) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content:
                        Text('환영합니다. ${authClient.user!.email!} '),
                        duration: const Duration(milliseconds: 2),
                        ));
              Get.off(const TabPage());
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(const SnackBar(
                  content: Text('이메일과 비밀번호를 확인하세요'),
                  
                  ));
            }
          });
        },
        child: const Text('로그인'),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Get.off(const SigninPage());
        },
        child: const Text(
          '이메일로 회원가입하기',
        ));
  }
}


// 이메일 찾기
class LostEmail extends StatelessWidget {
  const LostEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// 비번 찾기
class LostPassword extends StatelessWidget {
  const LostPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
