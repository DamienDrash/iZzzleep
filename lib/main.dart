import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzzleep/screens/alarm_overview.dart';
import 'package:izzzleep/screens/daily_screen.dart';
import 'package:izzzleep/screens/set_alarm_screen.dart';
import 'package:izzzleep/widgets/drawer/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var _enable = false;
    return ScreenUtilInit(
        designSize: Size(828, 1792),
        builder: () {
          return MaterialApp(
            routes: <String, WidgetBuilder>{
              "/screen1": (BuildContext countext) => AlarmOverView(),
              "/screen2": (BuildContext countext) => AlarmOverView(),
            },
            debugShowCheckedModeBanner: false,
            title: 'iZzzleep',
            home: const Scaffold(
              body: RootPage(),
              backgroundColor: Color(0xfff0f0f0),
            ),
          );
        });
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final int screen = 0;

  void showDrawer() {
    print('tapped on show drawer!');
    setState(() {
      _showDrawer = !_showDrawer;
    });
  }

  bool _showDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xfff0f0f0),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: NeumorphicFloatingActionButton(
                onPressed: showDrawer,
                style: const NeumorphicStyle(color: const Color(0xfff0f0f0)),
                child: const Icon(
                  Icons.menu_rounded,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
          body: IndexedStack(
            index: screen,
            children: const [SetAlarm(), DailySummary(), AlarmOverView()],
          ),
        ),
        if (_showDrawer)
          DrawerWidget(
            closeFunction: showDrawer,
          ),
      ],
    );
  }
}
