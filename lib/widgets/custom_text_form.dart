import 'package:flutter/material.dart';
import 'package:suitmedia_test/shared/theme.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;

  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffE2E3E4),
          width: 0.5,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        onChanged: onChanged,
        style: mediumTextStyle.copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: mediumTextStyle.copyWith(
            fontSize: 16,
            color: Color(0xff6867775C).withOpacity(0.36),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
            left: 20,
            bottom: 8,
          ),
        ),
      ),
    );
  }
}
