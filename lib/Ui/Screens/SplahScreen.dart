import 'package:el7areef/Ui/Screens/home_page.dart';
import 'package:el7areef/utils/colors_file.dart';
import 'package:el7areef/utils/navigator.dart';
import 'package:flutter/material.dart';

import 'dart:async';


// ignore: camel_case_types
class SplashScreen extends StatefulWidget {
  @override
  _openState createState() => _openState();
}

// ignore: camel_case_types
class _openState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      navigateAndClearStack(context,HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryAppColor,
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset("images/football-player-setting-ball.svg",color: primaryAppColor,height: 100,),
              SizedBox(height: 20),
              Text("FootBall",style: TextStyle(color:primaryAppColor,fontSize: 40 ),),
            ],
          )
      ),
    );
  }
}
