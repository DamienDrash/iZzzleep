import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                          ),
                          Placeholder(
                            fallbackHeight: 25,
                            fallbackWidth: 25,
                          )
                        ],
                      ),
                    ),
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
                          const EdgeInsets.only(top: 10, left: 50, right: 50),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  IconData(0xeecb, fontFamily: 'MaterialIcons'),
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Schlafen",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto'),
                                ),
                              ],
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_alarm_outlined,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Aufstehen",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto'),
                                ),
                              ],
                            )
                          ]),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 2, left: 50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("22:15",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  color: Colors.black45,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto')),
                          Text("6:30",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  color: Colors.black45,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto'))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 50, right: 50),
                      child: Placeholder(
                        fallbackHeight: 300,
                      ),
                    ),
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
