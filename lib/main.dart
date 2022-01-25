import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzzleep/screens/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(828, 1792),
        builder: () {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'iZzzleep',
            home: Scaffold(
              body: RootPage(),
              backgroundColor: Color(0xfff0f0f0),
            ),
          );
        });
  }
}
