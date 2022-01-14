import 'package:flutter/material.dart';
import 'package:izzzleep/widgets/alarm/alarm_tile.dart';

class AlarmOverView extends StatelessWidget {
  const AlarmOverView({Key? key}) : super(key: key);

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
            children: const [
              SizedBox(
                height: 100,
              ),
              Text(
                "Alarm in\n13 houres 18 minutes",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 50,
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
  }
}
