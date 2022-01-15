import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_container/neumorphic_container.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50.0.w),
                child: NeumorphicContainer(
                  depth: (val) ? 15 : -15,
                  height: 90.h,
                  width: 315.w,
                  borderRadius: 10.sp,
                  primaryColor: Color(0xfff0f0f0),
                  curvature: Curvature.flat,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0.h, left: 70.w),
                child: Text(
                  (clockText.isEmpty) ? "00:00" : clockText,
                  style: TextStyle(
                      color: (val) ? Colors.black45 : Colors.black12,
                      fontSize: 30.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.h, left: 295.w),
                child: NeumorphicSwitch(
                    style:
                        NeumorphicSwitchStyle(activeTrackColor: Colors.amber),
                    isEnabled: true,
                    height: 25.h,
                    value: val,
                    onChanged: (val) {
                      _handleTap();
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0.h, left: 70.w),
                child: Text(
                  "M",
                  style: TextStyle(
                      color:
                          (isMondayOn && val) ? Colors.black45 : Colors.black12,
                      fontSize: 15.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0.h, left: 90.w),
                child: Text(
                  "T",
                  style: TextStyle(
                      color: (isTuesdayOn && val)
                          ? Colors.black45
                          : Colors.black12,
                      fontSize: 15.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0.h, left: 110.w),
                child: Text(
                  "W",
                  style: TextStyle(
                      color: (isWednesdayOn && val)
                          ? Colors.black45
                          : Colors.black12,
                      fontSize: 15.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0.h, left: 130.w),
                child: Text(
                  "T",
                  style: TextStyle(
                      color: (isThursdayOn && val)
                          ? Colors.black45
                          : Colors.black12,
                      fontSize: 15.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0.h, left: 150.w),
                child: Text(
                  "F",
                  style: TextStyle(
                      color:
                          (isFridayOn && val) ? Colors.black45 : Colors.black12,
                      fontSize: 15.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0.h, left: 170.w),
                child: Text(
                  "S",
                  style: TextStyle(
                      color: (isSaturdayOn && val)
                          ? Colors.black45
                          : Colors.black12,
                      fontSize: 15.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0.h, left: 190.w),
                child: Text(
                  "S",
                  style: TextStyle(
                      color:
                          (isSundayOn && val) ? Colors.black45 : Colors.black12,
                      fontSize: 15.sp),
                ),
              )
            ],
          );
        });
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