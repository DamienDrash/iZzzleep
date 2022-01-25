import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzzleep/widgets/daily_summary/line_widget.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:pie_chart/pie_chart.dart' as pie;

class DailySummary extends StatefulWidget {
  const DailySummary({Key? key}) : super(key: key);

  @override
  _DailySummaryState createState() => _DailySummaryState();
}

class _DailySummaryState extends State<DailySummary> {
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
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.center,
                child: SizedBox(
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
                        child: SizedBox(
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
                                padding: EdgeInsets.only(left: 5.w, top: 10.h),
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
                      const LineWidget(),
                      // Daily Doughnut Charts
                      SizedBox(
                        height: 30.h,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.w, left: 8.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              WeekdayDoughnutWidget(value: 80, name: "M"),
                              WeekdayDoughnutWidget(value: 90, name: "T"),
                              WeekdayDoughnutWidget(value: 75, name: "W"),
                              WeekdayDoughnutWidget(value: 95, name: "T"),
                              WeekdayDoughnutWidget(value: 85, name: "F"),
                              WeekdayDoughnutWidget(value: 0, name: "S"),
                              WeekdayDoughnutWidget(value: 0, name: "S")
                            ],
                          ),
                        ),
                      ),
                      // Line delimitor
                      const LineWidget(),
                      Padding(
                        padding: EdgeInsets.all(10.0.sp),
                        child: //Placeholder(fallbackHeight: 196, fallbackWidth: 350,),
                            const NightOverview(),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      // Sleep phase chart
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 20.h,
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Sleep\nQuality",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black45,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text("80%",
                                      style: TextStyle(
                                          fontSize: 45.sp,
                                          color: Colors.amber,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                          const ProgressChart(title: "Duration", value: 85),
                          const ProgressChart(title: "REM", value: 70),
                          const ProgressChart(title: "Deep sleep", value: 60),
                          const ProgressChart(title: "Movement", value: 80),
                          const ProgressChart(title: "Snoring", value: 60),
                          const ProgressChart(title: "Heart rate", value: 90),
                          SizedBox(
                            height: 15.h,
                          ),
                          // Line delimitor
                          const LineWidget(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

// Progress Chart Widget
class ProgressChart extends StatefulWidget {
  final String title;
  final double value;
  const ProgressChart({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  _ProgressChartState createState() => _ProgressChartState();
}

class _ProgressChartState extends State<ProgressChart> {
  late String name;
  late double value = 0;
  @override
  void initState() {
    name = widget.title;
    value = (widget.value / 100);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double scrHeight = MediaQuery.of(context).size.height;
    final double scrWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 10.w, bottom: 15.h),
          child: SizedBox(
            width: 100.w,
            child: Text(name,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black45,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Neumorphic(
            style: const NeumorphicStyle(depth: -3),
            child: Container(
              height: 15.h,
              width: 200.w,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Stack(
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (rect) {
                      return LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [
                            0,
                            value * 0.75,
                            value
                          ],
                          colors: [
                            Colors.amber,
                            Colors.amber,
                            Colors.grey[200]!
                          ]).createShader(rect);
                    },
                    child: Container(
                      height: 15.h,
                      width: 200.w,
                      decoration: const BoxDecoration(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Doughnut Chart Widget
class WeekdayDoughnutWidget extends StatefulWidget {
  final double value;
  final String name;
  const WeekdayDoughnutWidget({Key? key, this.value = 0, this.name = ""})
      : super(key: key);

  @override
  State<WeekdayDoughnutWidget> createState() => _WeekdayDoughnutWidgetState();
}

class _WeekdayDoughnutWidgetState extends State<WeekdayDoughnutWidget> {
  late Map<String, double> dataMap;
  late String name;
  late double size = 0;
  @override
  void initState() {
    double firstValue = widget.value;
    double secondValue = (100 - widget.value);
    name = widget.name;

    if (name == "M") {
      size = 12.0.w;
    } else if (name == "W") {
      size = 11.0.w;
    } else {
      size = 14.0.w;
    }

    dataMap = {
      "Sleep": firstValue,
      "Awake": secondValue,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        style: NeumorphicStyle(
            color: Colors.grey[200],
            boxShape: const NeumorphicBoxShape.circle(),
            depth: 6),
        child: Stack(
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(-1.5),
              child: pie.PieChart(
                dataMap: dataMap,
                chartType: pie.ChartType.ring,
                emptyColor: Colors.grey[350]!,
                colorList: [Colors.amber, Colors.grey[300]!.withOpacity(0.5)],
                ringStrokeWidth: 3.w,
                legendOptions: const pie.LegendOptions(
                  showLegendsInRow: false,
                  showLegends: false,
                ),
                chartValuesOptions: const pie.ChartValuesOptions(
                  showChartValueBackground: false,
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: size),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black45,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}

// Area Chart Widget
class NightOverview extends StatefulWidget {
  const NightOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<NightOverview> createState() => _NightOverviewState();
}

class _NightOverviewState extends State<NightOverview> {
  @override
  Widget build(BuildContext context) {
    List<double> data = [
      80,
      10,
      20,
      40,
      10,
      45,
      30,
      15,
      50,
      25,
      20,
      70,
      60,
      65,
      20,
      25,
      5,
      40,
      80
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Neumorphic(
        style: NeumorphicStyle(color: Colors.grey[200]),
        child: SizedBox(
            height: 196.h,
            width: 350.w,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 35.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Awake",
                        style:
                            TextStyle(fontSize: 10.sp, color: Colors.black45),
                      ),
                      Text(
                        "Sleep",
                        style:
                            TextStyle(fontSize: 10.sp, color: Colors.black45),
                      ),
                      Text(
                        "Deep\nSleep",
                        style:
                            TextStyle(fontSize: 10.sp, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: 10.w, top: 10.h, left: 5.w, bottom: 5.h),
                      child: Sparkline(
                        data: data,
                        fallbackWidth: 266.3.w,
                        fallbackHeight: 150.h,
                        lineWidth: 2.0.w,
                        lineColor: Colors.amber,
                        useCubicSmoothing: true,
                        cubicSmoothingFactor: 0.2,
                        averageLine: false,
                        averageLabel: false,
                        fillMode: FillMode.below,
                        fillGradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x00FFC107), Color(0x80FFC107)]),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 28.w),
                          child: Text("0",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black45)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 28.w),
                          child: Text("1",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black45)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 28.w),
                          child: Text("2",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black45)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 28.w),
                          child: Text("3",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black45)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 28.w),
                          child: Text("4",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black45)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 28.w),
                          child: Text("5",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black45)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 28.w),
                          child: Text("6",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black45)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 28.w),
                          child: Text("7",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black45)),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
