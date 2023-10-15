import 'package:untitled1/common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
 //파라미터로 따로 받음 (외부에서 적용)
  final String? hintText;
  final String? errorText;
  final bool autofocus;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    required this.onChanged,
    this.obscureText = false,
    this.autofocus = false,
     this.hintText,
     this.errorText,
     Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final baseBorder = OutlineInputBorder(
     borderSide: BorderSide(
       color: PRIMARY_COLOR,
       width: 1.0,
     ),
   );
    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      autofocus: autofocus,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
      contentPadding: EdgeInsets.all(20),
      hintText: hintText,
      errorText: errorText,
      hintStyle: TextStyle(
        color: BODY_TEXT_COLOR,
        fontSize: 14.0,

      ),
      fillColor: INPUT_BG_COLOR,
      filled: true,
       border:  baseBorder,
       enabledBorder: baseBorder,
       focusedBorder: baseBorder.copyWith(
         borderSide: baseBorder.borderSide.copyWith(
           color: PRIMARY_COLOR,
         ),
       ),
        // 모든 input 상태
        ),
      );
  }
}