import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:izzzleep/widgets/alarm/weekday_widget.dart';

class SetWeekday extends StatefulWidget {
  const SetWeekday({Key? key}) : super(key: key);

  @override
  _SetWeekdayState createState() => _SetWeekdayState();
}

class _SetWeekdayState extends State<SetWeekday> {
  bool isMonday = false;
  bool isTuesday = false;
  bool isWednesday = false;
  bool isThursday = false;
  bool isFriday = false;
  bool isSaturday = false;
  bool isSunday = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WeekdayButton(
          text: "M",
          isChecked: isMonday,
          onChange: (bool isMonday) {
            isMonday = !isMonday;
          },
        ),
        WeekdayButton(
          text: "T",
          isChecked: isTuesday,
          onChange: (bool isTuesday) {
            isTuesday = !isTuesday;
          },
        ),
        WeekdayButton(
          text: "W",
          isChecked: isWednesday,
          onChange: (bool isWednesday) {
            isWednesday = !isWednesday;
          },
        ),
        WeekdayButton(
          text: "T",
          isChecked: isThursday,
          onChange: (bool isThursday) {
            isThursday = !isThursday;
          },
        ),
        WeekdayButton(
          text: "F",
          isChecked: isFriday,
          onChange: (bool isFriday) {
            isFriday = !isFriday;
          },
        ),
        WeekdayButton(
          text: "S",
          isChecked: isSaturday,
          onChange: (bool isSaturday) {
            isSaturday = !isSaturday;
          },
        ),
        WeekdayButton(
          text: "S",
          isChecked: isSunday,
          onChange: (bool isSunday) {
            isSunday = !isSunday;
          },
        ),
      ],
    );
  }
}
