import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzzleep/widgets/alarm/alarm_tile.dart';

class AlarmOverView extends StatelessWidget {
  const AlarmOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Text(
                      "Alarm in\n13 houres 18 minutes",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.sp),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    AlarmPanelTile(
                      clockText: "06:00",
                      val: true,
                      isMondayOn: true,
                      isTuesdayOn: true,
                      isWednesdayOn: true,
                      isThursdayOn: true,
                      isFridayOn: true,
                      isSaturdayOn: false,
                      isSundayOn: false,
                    ),
                    AlarmPanelTile(
                        clockText: "06:00",
                        val: true,
                        isMondayOn: true,
                        isTuesdayOn: true,
                        isWednesdayOn: true,
                        isThursdayOn: true,
                        isFridayOn: true,
                        isSaturdayOn: false,
                        isSundayOn: false),
                    AlarmPanelTile(
                        clockText: "06:00",
                        val: true,
                        isMondayOn: true,
                        isTuesdayOn: true,
                        isWednesdayOn: true,
                        isThursdayOn: true,
                        isFridayOn: true,
                        isSaturdayOn: false,
                        isSundayOn: false),
                    AlarmPanelTile(
                        clockText: "06:00",
                        val: true,
                        isMondayOn: true,
                        isTuesdayOn: true,
                        isWednesdayOn: true,
                        isThursdayOn: true,
                        isFridayOn: true,
                        isSaturdayOn: false,
                        isSundayOn: false)
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Add alarm',
              backgroundColor: Colors.amber,
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
