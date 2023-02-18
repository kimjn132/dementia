import 'package:dementia/firebase_options.dart';
import 'package:dementia/models/model_auth.dart';
import 'package:dementia/view/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirebaseAuthProvider(),
        )
      ],
      child: 
      GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: const Color(0xff45B6CC),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff45B6CC),
            elevation: 0,
          ),
          // Define the default font family.
          fontFamily: 'NotoSans',
          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
            displayLarge:
                TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                fontSize: 30.0,
                fontStyle: FontStyle.normal,
                fontFamily: 'Hind'),
            bodyMedium: TextStyle(fontSize: 20.0, fontFamily: 'NotoSans'),
          ),
          tabBarTheme: const TabBarTheme(
          labelColor: Color(0xff383636),
          ),
          buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xff97CFC1),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
