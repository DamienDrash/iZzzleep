import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

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
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              Center(child: Text("Das ist ein Test!")),
              Container(
                  width: 70.w, //Scaled based on the screen's width;
                  height: 250.h, //Scaled based on the screen's height;
                  child: Text("Responsive Design",
                      style: TextStyle(fontSize: 18.sp)) //Adapted Font
                  )
            ],
          ),
        ),
      ),
    );
  }
}
