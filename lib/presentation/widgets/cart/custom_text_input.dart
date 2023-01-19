import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required String hintText,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
    K,
  })  : _hintText = hintText,
        _padding = padding;

  final String _hintText;
  final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: Colors.grey.withOpacity(.1),
        shape: const StadiumBorder(),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
          contentPadding: _padding,
        ),
      ),
    );
  }
}
