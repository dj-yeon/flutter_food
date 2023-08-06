import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  const CustomTextFormFiled({
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,

      // 비밀번호 입력시 *로 입력되게
      obscureText: obscureText,

      // 실행시, 커서를 넣어주는것
      autofocus: autofocus,

      // 값이 변할때마다 실행될 콜백함수
      onChanged: onChanged,

      decoration: InputDecoration(
        // The padding for the input decoration's container.
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        // 배경색 채울 때, filled에 bool값 넣어줘야함
        fillColor: INPUT_BG_COLOR,
        filled: true,
        //
        border: baseBorder,
        // 원래 기본값인 테두리를 커스텀 한 값으로 수정됨.
        enabledBorder: baseBorder,
        //.copyWith- 상태 그대로 복사해서~
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
