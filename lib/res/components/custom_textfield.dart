import 'package:flutter/material.dart';
import 'package:fluttermyappp/conts/conts.dart';


class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final Color textColor;
  final Color borderColor;
  final Color inputColor;
  const CustomTextField({super.key,
    required this.hint, this.textController,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.inputColor = Colors.black,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      cursorColor: AppColors.blueColor,
      style: TextStyle(color: widget.inputColor),
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          )),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
        border: OutlineInputBorder(borderSide: BorderSide()),
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: widget.textColor,
        )),
    );
  }
}