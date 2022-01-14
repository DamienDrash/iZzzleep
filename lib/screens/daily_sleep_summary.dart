import 'package:flutter/material.dart';
import 'package:izzzleep/widgets/daily_summary/line_widget.dart';
import 'package:izzzleep/widgets/daily_summary/pie_chart_widget_1.dart';
import 'package:neumorphic_container/neumorphic_container.dart';

class DailySleepSummary extends StatelessWidget {
  const DailySleepSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("Friday",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 30)),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("30 - 31 December",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
              LineWidget(),
              WeekDayPieChart(
                value: 80,
                weekdayLetter: "W",
              ),
              LineWidget(),
              Placeholder(
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
