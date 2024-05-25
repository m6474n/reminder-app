import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/utils/constants.dart';

class CustomInputField extends StatelessWidget {
 final String hint, label;
  final IconData? icon;
  final Widget? widget;
  int? lines;
  final VoidCallback? onTap;

  final TextEditingController? controller;
   CustomInputField({super.key, required this.hint,  this.icon,this.lines,  this.onTap,   this.widget,  this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(label, style: mediumHeading),
          SizedBox(height: 4,),
          TextFormField(
            maxLines: lines,
            readOnly: icon == null || widget==null? false:true,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: Get.isDarkMode? Color(0xff33333f):Colors.grey.shade200,
filled: true,
              suffixIcon: IconButton(icon:Icon(icon),onPressed: onTap,),
              suffix: widget,
              hintStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
              )
            ),
          ),
        ],
      ),
    );
  }
}
