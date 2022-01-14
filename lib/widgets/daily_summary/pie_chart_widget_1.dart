import 'package:flutter/material.dart';
import 'package:neumorphic_container/neumorphic_container.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeekDayPieChart extends StatefulWidget {
  final double value;
  final String weekdayLetter;
  const WeekDayPieChart(
      {Key? key, required this.value, required this.weekdayLetter})
      : super(key: key);

  @override
  _WeekDayPieChartState createState() =>
      _WeekDayPieChartState(this.value, this.weekdayLetter);
}

class _WeekDayPieChartState extends State<WeekDayPieChart> {

  _WeekDayPieChartState(double value, String weekdayLetter) {
    final _val = value;
    final weekday = weekdayLetter;
  }

  final List<ChartData> chartData = [
    ChartData('sleep', _WeekDayPieChartState!.widget.value! , Colors.amber),
    ChartData('awake', 100 - _WeekDayPieChartState().widget.value, Color(0xfff0f0f0))
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(widget.weekdayLetter),
        Text(widget.value.toString()),
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
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color = const Color.fromRGBO(9, 0, 136, 1)]);
  final String x;
  final double y;
  final Color color;
}



/* NeumorphicContainer(
          depth: 20,
          height: 30,
          width: 30,
          borderRadius: 30,
          primaryColor: Color(0xfff0f0f0),
          curvature: Curvature.flat,
          child:"") */