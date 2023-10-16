import 'package:flutter/material.dart';
import 'package:untitled1/common/view/splash_screen.dart';
import 'package:untitled1/user/view/login_screen.dart';
import 'package:untitled1/common/component/custom_text_form_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',


      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
