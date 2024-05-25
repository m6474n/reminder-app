import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/components/CustomButton.dart';
import 'package:reminder_app/controller/mainController.dart';
import 'package:reminder_app/screens/addReminder.dart';
import 'package:reminder_app/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder(
        init: MainAppController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  controller.changTheme();
                },
                icon: Get.isDarkMode
                    ? Icon(Icons.dark_mode_outlined):Icon(Icons.light_mode)

              ),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                          DateFormat.yMMMEd().format(DateTime.now()),
                              style:
                               textStyle
                            ),
                            Text(
                              "Today ",
                              style: largeHeading
                            ),
                          ],
                        )),
                        Expanded(child: Container(
                            height: 55,
                            child: CustomButton(
                              ontap: (){},
                              title: "Add New",bgColor: purpleColor,)))
                      ],
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(() => AddReminder());
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
