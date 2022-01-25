import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';
import 'package:intl/intl.dart' as intl;

class SetAlarmWidget extends StatefulWidget {
  const SetAlarmWidget({Key? key}) : super(key: key);

  @override
  _SetAlarmWidgetState createState() => _SetAlarmWidgetState();
}

class _SetAlarmWidgetState extends State<SetAlarmWidget> {
  ClockTimeFormat _clockTimeFormat = ClockTimeFormat.twentyFourHours;

  PickedTime _inBedTime = PickedTime(h: 0, m: 0);
  PickedTime _outBedTime = PickedTime(h: 8, m: 0);
  PickedTime _intervalBedTime = PickedTime(h: 0, m: 0);

  double _sleepGoal = 8.0;
  bool _isSleepGoal = false;

  @override
  void initState() {
    super.initState();
    _isSleepGoal = (_sleepGoal >= 8.0) ? true : false;
    _intervalBedTime = formatIntervalTime(
        init: _inBedTime, end: _outBedTime, clockTimeFormat: _clockTimeFormat);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            IconData(0xeecb, fontFamily: 'MaterialIcons'),
                            color: Colors.black45,
                          ),
                          const SizedBox(
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
                          const Icon(
                            Icons.access_alarm_outlined,
                            color: Colors.black45,
                          ),
                          const SizedBox(
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
                padding: const EdgeInsets.only(top: 2, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${intl.NumberFormat('00').format(_inBedTime.h)}:${intl.NumberFormat('00').format(_inBedTime.m)}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.black45,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto')),
                    Text(
                        '${intl.NumberFormat('00').format(_outBedTime.h)}:${intl.NumberFormat('00').format(_outBedTime.m)}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.black45,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto'))
                  ],
                ),
              ),
              TimePicker(
                initTime: _inBedTime,
                endTime: _outBedTime,
                height: 260.0,
                width: 260.0,
                onSelectionChange: _updateLabels,
                onSelectionEnd: (a, b) => print(
                    'onSelectionEnd => init : ${a.h}:${a.m}, end : ${b.h}:${b.m}'),
                primarySectors: _clockTimeFormat.value,
                secondarySectors: _clockTimeFormat.value * 2,
                decoration: TimePickerDecoration(
                  baseColor: Colors.grey[300]!,
                  pickerBaseCirclePadding: 15.0,
                  sweepDecoration: TimePickerSweepDecoration(
                      pickerStrokeWidth: 30,
                      pickerColor:
                          _isSleepGoal ? Colors.amber : Colors.grey[350],
                      connectorColor: Colors.grey[200],
                      showConnector: true),
                  initHandlerDecoration: TimePickerHandlerDecoration(
                    color: Colors.grey[200]!,
                    shape: BoxShape.circle,
                    radius: 12.0,
                    icon: const Icon(
                      IconData(0xeecb, fontFamily: 'MaterialIcons'),
                      color: Colors.amber,
                      size: 20,
                    ),
                  ),
                  endHandlerDecoration: TimePickerHandlerDecoration(
                    color: Colors.grey[200]!,
                    shape: BoxShape.circle,
                    radius: 12.0,
                    icon: const Icon(
                      Icons.access_alarm_outlined,
                      color: Colors.amber,
                      size: 20,
                    ),
                  ),
                  primarySectorsDecoration: TimePickerSectorDecoration(
                    color: Colors.black45,
                    width: 3.0,
                    size: 4.0,
                    radiusPadding: 25.0,
                  ),
                  secondarySectorsDecoration: TimePickerSectorDecoration(
                    color: Colors.amber,
                    width: 2.0,
                    size: 2.0,
                    useRoundedCap: true,
                    radiusPadding: 25.0,
                  ),
                  clockNumberDecoration: TimePickerClockNumberDecoration(
                    defaultTextColor: Colors.black45,
                    defaultFontSize: 12.0,
                    scaleFactor: 2.0,
                    showNumberIndicators: true,
                    textScaleFactor: 0.5,
                    style12: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black45,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto'),
                    style9: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black45,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto'),
                    style6: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black45,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto'),
                    style3: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black45,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto'),
                    clockTimeFormat: _clockTimeFormat,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(62.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${intl.NumberFormat('00').format(_intervalBedTime.h)}Hr ${intl.NumberFormat('00').format(_intervalBedTime.m)}Min',
                        style: TextStyle(
                            fontSize: 14.0,
                            color:
                                _isSleepGoal ? Colors.amber : Colors.grey[350],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _updateLabels(PickedTime init, PickedTime end) {
    _inBedTime = init;
    _outBedTime = end;
    _intervalBedTime = formatIntervalTime(
        init: _inBedTime, end: _outBedTime, clockTimeFormat: _clockTimeFormat);
    _isSleepGoal = validateSleepGoal(
      inTime: init,
      outTime: end,
      sleepGoal: _sleepGoal,
      clockTimeFormat: _clockTimeFormat,
    );
    setState(() {});
  }
}
