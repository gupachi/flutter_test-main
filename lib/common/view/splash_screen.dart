import 'dart:js';
import 'dart:js_interop_unsafe';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/common/const/colors.dart';
import 'package:untitled1/common/const/data.dart';
import 'package:untitled1/common/layout/default_layout.dart';
import 'package:untitled1/common/view/root_tab.dart';
import 'package:untitled1/user/view/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  State<StatefulWidget> createState() => _SplashScreen();
}
class _SplashScreen extends State<SplashScreen> {
  //안에서는 await할 수가 없음
  void inintState(){
    super.initState();
    deleteToken();
    checkToken();
  }
  void deleteToken() async {
    await storage.deleteAll();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  }
  void checkToken() async {
    // 들어오는 데이터를 저장한다.
    // 로그인을 한번도 안하면 데이터가 저장이 되있지 않다.

    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final dio = Dio();
    try {
      final resp = await dio.post(
        'http://$ip/auth/token',
        options: Options(
          headers: 'authorization': 'Bearer $refreshToken',
            },
        ),
      );
    }catch{

    }
    if(refreshToken == null || accessToken == null){
      Navigator.of(context as BuildContext).pushAndRemoveUntil
        (MaterialPageRoute(builder: (_) => LoginScreen(),), (route) => false,);
    }
    else{
      Navigator.of(context as BuildContext).pushAndRemoveUntil
      (MaterialPageRoute(builder: (_) =>RootTab(),), (route) => false,);
  }

  Widget build(BuildContext context) {
    // 고정된 layout
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        // 최대 크기로 맞춘다.
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2,
            ),
            const SizedBox(height: 16.0),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

}