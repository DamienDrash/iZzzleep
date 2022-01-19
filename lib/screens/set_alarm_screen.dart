import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzzleep/widgets/alarm/set_alarm_widget.dart';
import 'package:izzzleep/widgets/alarm/set_weekdays_widget.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class SetAlarm extends StatelessWidget {
  const SetAlarm({Key? key}) : super(key: key);
  final bool val = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              title: Text("Schlafenszeit",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Roboto')),
              backgroundColor: Color(0xfff0f0f0),
              toolbarHeight: 30,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Wochentage",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black45,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto'),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 30, right: 30),
                        child: SetWeekday()),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 50, right: 50),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: NeumorphicSwitch(
                            style: NeumorphicSwitchStyle(
                                activeTrackColor: Colors.amber),
                            isEnabled: true,
                            height: 25.h,
                            value: val,
                            onChanged: (val) {}),
                      ),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 50, right: 50),
                        child: SetAlarmWidget()),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 2, left: 50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Auschaltmethode",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black45,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto')),
                          Text("Matheaufgaben",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black45,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto'))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 2, left: 50, right: 50),
                      child: NeumorphicSlider(
                        min: 0,
                        max: 100,
                        value: 30,
                        style: SliderStyle(
                            variant: Colors.amber, accent: Colors.amber),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
