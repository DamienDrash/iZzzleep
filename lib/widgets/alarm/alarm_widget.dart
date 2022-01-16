import 'package:flutter/material.dart';
import 'package:neumorphic_container/neumorphic_container.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AlarmPanel extends StatelessWidget {
  final String clockText;
  final bool isMondayOn;
  final bool isTuesdayOn;
  final bool isWednesdayOn;
  final bool isThursdayOn;
  final bool isFridayOn;
  final bool isSaturdayOn;
  final bool isSundayOn;

  const AlarmPanel(
      {Key? key,
      required this.clockText,
      required this.val,
      required this.onChanged,
      this.isMondayOn = false,
      this.isTuesdayOn = false,
      this.isWednesdayOn = false,
      this.isThursdayOn = false,
      this.isFridayOn = false,
      this.isSaturdayOn = false,
      this.isSundayOn = false})
      : super(key: key);

  final bool val;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!val);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: NeumorphicContainer(
            depth: (val) ? 15 : -15,
            height: 90.h,
            width: 315.w,
            borderRadius: 10,
            primaryColor: Color(0xfff0f0f0),
            curvature: Curvature.flat,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0.h, left: 40.w),
          child: Text(
            (clockText.isEmpty) ? "00:00" : clockText,
            style: TextStyle(
                color: (val) ? Colors.black45 : Colors.black12, fontSize: 30),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.h, left: 265.w),
          child: NeumorphicSwitch(
              style: NeumorphicSwitchStyle(activeTrackColor: Colors.amber),
              isEnabled: true,
              height: 25.h,
              value: val,
              onChanged: (val) {
                _handleTap();
              }),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.0.h, left: 40.w),
          child: Text(
            "M",
            style: TextStyle(
                color: (isMondayOn && val) ? Colors.black45 : Colors.black12,
                fontSize: 15),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.0.h, left: 60.w),
          child: Text(
            "T",
            style: TextStyle(
                color: (isTuesdayOn && val) ? Colors.black45 : Colors.black12,
                fontSize: 15),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.0.h, left: 80.w),
          child: Text(
            "W",
            style: TextStyle(
                color: (isWednesdayOn && val) ? Colors.black45 : Colors.black12,
                fontSize: 15),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.0.h, left: 100.w),
          child: Text(
            "T",
            style: TextStyle(
                color: (isThursdayOn && val) ? Colors.black45 : Colors.black12,
                fontSize: 15),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.0.h, left: 120.w),
          child: Text(
            "F",
            style: TextStyle(
                color: (isFridayOn && val) ? Colors.black45 : Colors.black12,
                fontSize: 15),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.0.h, left: 140.w),
          child: Text(
            "S",
            style: TextStyle(
                color: (isSaturdayOn && val) ? Colors.black45 : Colors.black12,
                fontSize: 15),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.0.h, left: 160.w),
          child: Text(
            "S",
            style: TextStyle(
                color: (isSundayOn && val) ? Colors.black45 : Colors.black12,
                fontSize: 15),
          ),
        )
      ],
    );
  }
}





/*

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 10),
              child: 
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 70),
                child: Text(
                  "M",
                  style: TextStyle(
                      color: (isMondayOn) ? Colors.black12 : Colors.black45,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "T",
                  style: TextStyle(
                      color: (isMondayOn) ? Colors.black12 : Colors.black45,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "W",
                  style: TextStyle(
                      color: (isMondayOn) ? Colors.black12 : Colors.black45,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "T",
                  style: TextStyle(
                      color: (isMondayOn) ? Colors.black12 : Colors.black45,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "F",
                  style: TextStyle(
                      color: (isMondayOn) ? Colors.black12 : Colors.black45,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "S",
                  style: TextStyle(
                      color: (isMondayOn) ? Colors.black12 : Colors.black45,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "S",
                  style: TextStyle(
                      color: (isMondayOn) ? Colors.black12 : Colors.black45,
                      fontSize: 15),
                ),
              ),
            ])
          ],
        ),
*/