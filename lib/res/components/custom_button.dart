import 'package:flutter/cupertino.dart';
import 'package:fluttermyappp/conts/conts.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  const CustomButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: context.screenWidth,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueColor,
          foregroundColor: AppColors.whiteColor,
          shape: const StadiumBorder(),
        ),
        onPressed: onTap,
        child: buttonText.text.make(),
      ),
    );
  }
}