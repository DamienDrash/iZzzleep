import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzzleep/widgets/alarm/set_alarm_widget.dart';
import 'package:izzzleep/widgets/alarm/set_weekdays_widget.dart';

class SetAlarm extends StatefulWidget {
  const SetAlarm({Key? key}) : super(key: key);

  @override
  _SetAlarmState createState() => _SetAlarmState();
}

class _SetAlarmState extends State<SetAlarm> {
  @override
  double seekValue = 30;
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
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
              backgroundColor: const Color(0xfff0f0f0),
              toolbarHeight: 30.h,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0.w),
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
                            EdgeInsets.only(top: 10.h, left: 30.w, right: 30.w),
                        child: const SetWeekday()),
                    Padding(
                        padding:
                            EdgeInsets.only(top: 8.h, left: 30.w, right: 30.w),
                        child: const SetAlarmWidget()),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 2.h, left: 30.w, right: 30.w),
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
                          EdgeInsets.only(top: 2.h, left: 30.w, right: 30.w),
                      child: NeumorphicSlider(
                        min: 0,
                        max: 100,
                        value: seekValue,
                        onChanged: (value) {
                          setState(() {
                            seekValue = value;
                          });
                        },
                        style: SliderStyle(
                            depth: -3,
                            variant: Colors.amber,
                            accent: Colors.amber[300]),
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
