import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzzleep/widgets/alarm/weekday_widget.dart';

class SetWeekday extends StatefulWidget {
  const SetWeekday({Key? key}) : super(key: key);

  @override
  _SetWeekdayState createState() => _SetWeekdayState();
}

class _SetWeekdayState extends State<SetWeekday> {
  bool isMonday = true;
  bool isTuesday = false;
  bool isWednesday = false;
  bool isThursday = false;
  bool isFriday = false;
  bool isSaturday = false;
  bool isSunday = false;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              weekdayButton(),
              Placeholder(
                fallbackHeight: 25,
                fallbackWidth: 25,
              ),
              Placeholder(
                fallbackHeight: 25,
                fallbackWidth: 25,
              ),
              Placeholder(
                fallbackHeight: 25,
                fallbackWidth: 25,
              ),
              Placeholder(
                fallbackHeight: 25,
                fallbackWidth: 25,
              ),
              Placeholder(
                fallbackHeight: 25,
                fallbackWidth: 25,
              ),
              Placeholder(
                fallbackHeight: 25,
                fallbackWidth: 25,
              )
            ],
          );
        });
  }
}
