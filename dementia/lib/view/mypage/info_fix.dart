import 'package:dementia/models/model_auth.dart';
import 'package:dementia/models/model_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoFixChange extends StatefulWidget {
  const InfoFixChange({super.key});

  @override
  State<InfoFixChange> createState() => _InfoFixChangeState();
}

class _InfoFixChangeState extends State<InfoFixChange> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginModel(),
        child: Scaffold(
          body: Column(
            children: [
              InfoCheck()
            ],
          ),
        ),);
  }

  // --------------- widget ---------------

  
}

class InfoCheck extends StatelessWidget {
  const InfoCheck({super.key});

  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    final login = Provider.of<LoginModel>(context, listen: false);

    return Container(
      color: Color.fromARGB(255, 174, 205, 231),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Text(authClient.user!.email!),
    );
  }
}