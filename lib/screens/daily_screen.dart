import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzzleep/widgets/daily_summary/line_widget.dart';

class DailySummary extends StatelessWidget {
  const DailySummary({Key? key}) : super(key: key);

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
              child: Container(
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.h),
                        // Header: Weekday + Date Range
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 0.h),
                          child: Container(
                            height: 30.h,
                            child: Row(
                              children: [
                                // Weekday
                                Text(
                                  "Friday",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto'),
                                ),
                                // Date Range
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 5.w, top: 10.h),
                                  child: Text(
                                    "30. - 31. December",
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.black26),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // Line delimitor
                        LineWidget(),
                        // Daily Doughnut Charts
                        Container(
                          height: 30.h,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.w, left: 8.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Placeholder(
                                  fallbackWidth: 40,
                                  fallbackHeight: 40,
                                ),
                                Placeholder(
                                  fallbackWidth: 40,
                                  fallbackHeight: 40,
                                ),
                                Placeholder(
                                  fallbackWidth: 40,
                                  fallbackHeight: 40,
                                ),
                                Placeholder(
                                  fallbackWidth: 40,
                                  fallbackHeight: 40,
                                ),
                                Placeholder(
                                  fallbackWidth: 40,
                                  fallbackHeight: 40,
                                ),
                                Placeholder(
                                  fallbackWidth: 40,
                                  fallbackHeight: 40,
                                ),
                                Placeholder(
                                  fallbackWidth: 40,
                                  fallbackHeight: 40,
                                )
                              ],
                            ),
                          ),
                        ),
                        // Line delimitor
                        LineWidget(),
                        Padding(
                          padding: EdgeInsets.all(10.0.sp),
                          child: Placeholder(
                            fallbackHeight: 196,
                            fallbackWidth: 350,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // Sleep phase chart
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Placeholder(
                                    fallbackHeight: 100,
                                    fallbackWidth: 100,
                                  ),
                                  Placeholder(
                                    fallbackHeight: 100,
                                    fallbackWidth: 100,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, right: 50, top: 25, bottom: 25),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Placeholder(
                                    fallbackHeight: 100,
                                    fallbackWidth: 100,
                                  ),
                                  Placeholder(
                                    fallbackHeight: 100,
                                    fallbackWidth: 100,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Placeholder(
                                    fallbackHeight: 100,
                                    fallbackWidth: 100,
                                  ),
                                  Placeholder(
                                    fallbackHeight: 100,
                                    fallbackWidth: 100,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // Line delimitor
                            LineWidget(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
