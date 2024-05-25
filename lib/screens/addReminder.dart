import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/components/CustomAppbar.dart';
import 'package:reminder_app/components/CustomButton.dart';
import 'package:reminder_app/components/CustomDropdown.dart';
import 'package:reminder_app/components/CustomInputField.dart';
import 'package:reminder_app/controller/mainController.dart';
import 'package:reminder_app/utils/constants.dart';

class AddReminder extends StatefulWidget {
  const AddReminder({super.key});

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MainAppController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Add Task',
                          style: largeHeading
                        ),
                      ),
                      CustomInputField(
                        controller: controller.titleController,
                        hint: "Enter Title",
                        label: "Title",
                      ),
                      CustomInputField(
                        controller: controller.noteController,
                        hint: "Enter Description",
                        label: "Note",
                        lines: 4,
                      ),
                      CustomInputField(
                        hint: DateFormat.yMd().format(controller.selectedDate),
                        label: "Date",
                        onTap: () {
                          controller.datePicker(context);
                        },
                        icon: Icons.calendar_month,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomInputField(
                            label: "Start",
                            hint: controller.startTime,
                            onTap: () {
                              controller.setTime(
                                  context: context, isStartTime: true);
                            },
                            icon: Icons.watch_later_outlined,
                          )),
                          Expanded(
                              child: CustomInputField(
                            label: "End",
                            hint: controller.endTime,
                            icon: Icons.watch_later_outlined,
                            onTap: () {
                              controller.setTime(
                                  context: context, isStartTime: false);
                            },
                          )),
                        ],
                      ),

                      CustomDropDown(dataList: controller.reminderList, title: 'Remind', onChanged: (newValue){

                          controller.selectedReminder = newValue.toString().split(" ")[0];
                          print(controller.selectedReminder);

                      },),
                      CustomDropDown(dataList: controller.repeatList, title: 'Repeat', onChanged: (newValue){
                        controller.selectedRepeat = newValue.toString();
                        print(controller.selectedRepeat);
                      },)
                      // ,CustomDropDown(dataList: controller.repeatList, title: 'Repeat')
                      ,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 55,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Color',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )),
                                Expanded(
                                    child: CustomButton(
                                  ontap: () {},
                                  title: "Add",
                                  bgColor: purpleColor,
                                ))
                              ],
                            )),
                      ),
                      SizedBox(height: 16)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
