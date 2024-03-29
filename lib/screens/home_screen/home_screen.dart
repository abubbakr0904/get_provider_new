import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_provider_new/screens/api2_screen/api2_screen.dart';

import '../api1_screen/api1_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.w),
        width: phoneWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: phoneWidth ,
              height: 60.h,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Api1(),
                    ),
                  );
                },
                child: Text(
                  "Api Country",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30.sp),
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            SizedBox(
              width: phoneWidth,
              height: 60.h,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const APi2(),
                    ),
                  );
                },
                child: Text(
                  "Api Users",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30.sp),
                ),
              ),
            ),

          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}