import 'package:flutter/material.dart';
import 'package:neumorphic_container/neumorphic_container.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeekDayPieChart extends StatelessWidget {
    final num value;
  final String weekdayLetter;
  const WeekDayPieChart({ Key? key , required this.value, required this.weekdayLetter}) : super(key: key);

void initState() {
  final List<ChartData> chartData = [
    ChartData('sleep', value , Colors.amber),
    ChartData('awake', 100 - value, Color(0xfff0f0f0))
  ];
    super.initState();
  };

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {_getThingsOnStartup().then((value) {
          print('Async done');
        });print(weekdayLetter);},
      child: Stack(
        children: [
          Text(weekdayLetter),
          Text(value.toString()),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: NeumorphicContainer(
                  depth: 20,
                  height: 35,
                  width: 35,
                  borderRadius: 35,
                  primaryColor: Color(0xfff0f0f0),
                  curvature: Curvature.flat),
            ),
          ),
          Center(
            child: SizedBox(
                height: 70,
                child: SfCircularChart(borderWidth: 5, series: <CircularSeries>[
                  // Renders doughnut chart
                  DoughnutSeries<ChartData, String>(
                      dataSource: chartData,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y)
                ])),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text(
                "M",
                style: TextStyle(fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );

    Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 2));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color = const Color.fromRGBO(9, 0, 136, 1)]);
  final String x;
  final double y;
  final Color color;
}

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;

  const StatefulWrapper({@required this.onInit, @required this.child}) : super(key: key);

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if(widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
  }
