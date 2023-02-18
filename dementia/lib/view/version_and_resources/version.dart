import 'package:flutter/material.dart';

class VersionPage extends StatefulWidget {
  const VersionPage({super.key});

  @override
  State<VersionPage> createState() => _VersionPageState();
}

class _VersionPageState extends State<VersionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('버전 정보'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Dementia',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('버전 0.0.1',
            style: TextStyle(
              fontSize: 20,
            ),
            )
          ],
        ),
      ),
    );
  }
}