import 'package:el7areef/Ui/Screens/SplahScreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      canvasColor: Colors.transparent,
      fontFamily: "Saira_Regular",
    ),
    home: SplashScreen(),
    // home: CreateTeam(),
  ));
}
