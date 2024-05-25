import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/controller/mainController.dart';
import 'package:reminder_app/utils/constants.dart';

class CustomDropDown<T> extends StatefulWidget {
final String title;
 final List<String> dataList;
final Function(T)? onChanged;
  const CustomDropDown({super.key, required this.dataList, required this.title, required this.onChanged,});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainAppController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(widget.title,style: mediumHeading,),
              SizedBox(height: 4,),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border:Border.all(width: 1, color:Get.isDarkMode? Color(0xff33333f):Colors.white)),
                child: CustomDropdown(

                    decoration: CustomDropdownDecoration(
                      hintStyle: TextStyle(color: Get.isDarkMode? Colors.white:Colors.grey),
                        closedFillColor: Get.isDarkMode? Color(0xff33333f):Colors.grey.shade200,
                        headerStyle: TextStyle(color: Get.isDarkMode? Colors.white:Colors.black, fontSize: 16),
                        // headerStyle: TextStyle(color: Get.isDarkMode? Colors.white:Colors.black),
                        expandedFillColor: Get.isDarkMode? Color(0xff33333f):Colors.grey.shade200,
                        listItemStyle: TextStyle(color: Get.isDarkMode? Colors.white:Colors.black)
                    ),
                    items: widget.dataList, onChanged: widget.onChanged,))

            ],
          ),
        );
      }
    );
  }
}
