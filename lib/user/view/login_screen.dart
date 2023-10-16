import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/common/const/colors.dart';
import 'package:untitled1/common/layout/default_layout.dart';
import 'package:untitled1/common/view/root_tab.dart';
import '../../common/component/custom_text_form_field.dart';
import '../../common/const/data.dart';

class LoginScreen extends StatelessWidget{

  const LoginScreen({Key? key}) : super(key: key);

  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
   String username = '';
   String password ='';
  Widget build(BuildContext context) {
    final storage = FlutterSe
    final dio = Dio();
    final emulatorIp = '10.0.2.2:3000';
    final simulatorIp = '127.0.0.1:3000';
    final ip = Platform.isIos ? simulatorIp : emulatorIp;


  return DefaultLayout(
    child:SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: SafeArea(
      top:true,
      bottom: false,
      child:Padding(
      padding:const EdgeInsets.symmetric(horizontal:16.0),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Title(),
          const SizedBox(height: 16.0),
          _subTitle(),
          Image.asset(
            'asset/img/misc/logo.png',
              width: MediaQuery.of(context).size.width/3*2,
          ),
          CustomTextFormField(
            hintText: '이메일을 입력하세요',
            onChanged: (String value){
              username = value;
            } ,
          ),
          CustomTextFormField(
            hintText: '패스워드 입력하세요',
            onChanged: (String value){
              password = value;
            } ,
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(onPressed: () async{
            //입력값을 받는 것으로 하면 testcode는 어디 저장되어있는지
            final rawString = '$username:$password';
            Codec<String, String>  stringToBase64 = utf8.fuse(base64);
            String token = stringToBase64.encode(rawString);
            final resp = await dio.post('http://$ip/auth/login',

            options:Options(
              headers: {
                'authorization' : 'Basic $token',
              },
            ),//
            );
            final refreshToken = resp.data['refreshToken'];
            final accessToken = resp. data['accessToken'];
            await storage.write(key: REFRESH_TOKEN_KEY,value: refreshToken);
            await storage.write(key: ACCESS_TOKEN_KEY,accessToken);
            
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => RootTab()),
          );
          }, style: ElevatedButton.styleFrom(
            primary: PRIMARY_COLOR,

          ),
            child: Text(
              '로그인'
            ),
          ),
          ElevatedButton(onPressed: () async{
            final refrshToken = '';
            final resp = await dio.post('http://$ip/auth/token',
                options:Options(
                headers: {
                'authorization' : 'Basic $refreshToken',
                },
          }, style: ElevatedButton.styleFrom(
            primary: PRIMARY_COLOR,

          ),
            child: Text(
                '회원가입'
            ),
          ),
        ],
  ),
    ),
    ),
    ),
  );
  }
}



class _Title extends StatelessWidget{
  const _Title({Key? key}) : super(key: key);
  Widget build(BuildContext context){
    return Text(
      '환영합니다',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: Colors.black,

      ),
    );
  }
}
class _subTitle extends StatelessWidget{
  const _subTitle({Key? key}) : super(key: key);
  Widget build(BuildContext context){
    return Text(
      '이메일과 비밀번호를 입력해주세요',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: Colors.black,

      ),
    );
  }
}