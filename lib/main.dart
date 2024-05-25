import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferences.getInstance();

  await SharedPreferences.getInstance().then((value){
    if(value.getBool('darkMode')==null){
      value.setBool('darkMode', false);
    }
    else{
      darkMode = value.getBool('darkMode');
    }
  });
  runApp(const MyApp());
}
bool? darkMode  ;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Reminder App',
debugShowCheckedModeBanner: false,
      theme: darkMode == null || darkMode == false ? ThemeData.light(): ThemeData.dark(),
      home: const Home(),
    );
  }
}

