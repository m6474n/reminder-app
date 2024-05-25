import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainAppController extends GetxController {
  final titleController = TextEditingController();
  setThemeData(bool val)async{
    await SharedPreferences.getInstance().then((value){
     value.setBool('darkMode',  val);
    });
  }
  final noteController = TextEditingController();
  // final dateController = TextEditingController();
  // final startTimeController = TextEditingController();
  // final endTimeController = TextEditingController();
  final reminderController = TextEditingController();
DateTime selectedDate = DateTime.now();
String startTime = DateFormat('hh:mm a').format(DateTime.now());
String endTime = "09:30 pm";
String? selectedReminder ;
String? selectedRepeat ;
var dropValu;
  final List<String> reminderList = [
    "5 minutes early","10 minutes early","15 minutes early","20 minutes early","25 minutes early","30 minutes early"
  ];
   List<String> repeatList = [
   "None","Daily", "Weekly", "Monthly"
  ];

  changTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    var _darkTheme = Get.isDarkMode? false:true;
setThemeData(_darkTheme);
print(_darkTheme);
    update();
  }
  remindDropdown() {
    return DropdownButton<String>(
      icon: Icon(Icons.keyboard_arrow_down, size: 32,),
      elevation: 4,
      underline: Container(height: 0,),

      items: repeatList.map((String val) {
        return DropdownMenuItem<String>(
          value: val,

          child:
              Text(val),

        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          // do other stuff with _category
          print(newValue);
          dropValu = newValue;
        }
      },
      value: dropValu,

    );
  }
updateDropDownValue(String value, newValue){
    value = newValue;
    update();
}
  datePicker(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
        context: context,
        firstDate: DateTime(2024),
        lastDate: DateTime(2030),

        initialDate: DateTime.now());
    if(_datePicker!=null){
      selectedDate = _datePicker;
      update();

    }else{
      print('Something went wrong');
    }
  }
  setTime( {required BuildContext context, required bool isStartTime})async{
    var _pickedTime = await timePicker(context);
    String _formatedTime = _pickedTime.format(context);
    if(_pickedTime ==null){
      print("Time cancelled");

    }else if(isStartTime==true){
      startTime = _formatedTime
          ;update();
    }else if(isStartTime == false){
      endTime = _formatedTime;
      update();
    }
  }

  timePicker(BuildContext context){
    return   showTimePicker(context: context,
initialEntryMode: TimePickerEntryMode.input,
        initialTime: TimeOfDay(hour: int.parse(startTime.split(":")[0]), minute: int.parse(startTime.split(":")[1].split(" ")[0])));

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
