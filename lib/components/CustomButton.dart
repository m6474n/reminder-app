import 'package:flutter/material.dart';
import 'package:reminder_app/utils/constants.dart';

class CustomButton extends StatelessWidget {
 final String title;
 final Color? bgColor;
 final VoidCallback ontap;
  const CustomButton({super.key, required this.title, this.bgColor, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Center(child: Text(title, style:textStyle.copyWith(color: Colors.white) ,)),

        ),

      ),
    );
  }
}
