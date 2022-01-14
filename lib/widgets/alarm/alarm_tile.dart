import 'package:flutter/material.dart';
import 'package:izzzleep/widgets/alarm/alarm_widget.dart';

class AlarmPanelTile extends StatefulWidget {
  final String clockText;
  final bool val;
  final bool isMondayOn;
  final bool isTuesdayOn;
  final bool isWednesdayOn;
  final bool isThursdayOn;
  final bool isFridayOn;
  final bool isSaturdayOn;
  final bool isSundayOn;

  const AlarmPanelTile(
      {Key? key,
      required this.clockText,
      required this.val,
      this.isMondayOn = false,
      this.isTuesdayOn = false,
      this.isWednesdayOn = false,
      this.isThursdayOn = false,
      this.isFridayOn = false,
      this.isSaturdayOn = false,
      this.isSundayOn = false})
      : super(key: key);

  @override
  _AlarmPanelTileState createState() => _AlarmPanelTileState();
}

class _AlarmPanelTileState extends State<AlarmPanelTile> {
  bool _active = false;
  int counter = 0;

  void _handleChanged(bool newValue) {
    setState(() {
      _active = newValue;
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AlarmPanel(
        clockText: widget.clockText,
        val: (counter > 0) ? _active : widget.val,
        onChanged: _handleChanged,
        isMondayOn: widget.isMondayOn,
        isTuesdayOn: widget.isTuesdayOn,
        isWednesdayOn: widget.isWednesdayOn,
        isThursdayOn: widget.isThursdayOn,
        isFridayOn: widget.isFridayOn,
        isSaturdayOn: widget.isSaturdayOn,
        isSundayOn: widget.isSundayOn,
      ),
    );
  }
}
