import 'package:el7areef/Ui/Screens/home_screen.dart';
import 'package:el7areef/Ui/Screens/team.dart';
import 'package:el7areef/Ui/Widgets/custom_home_drawer.dart';
import 'package:el7areef/utils/colors_file.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = [
      HomeScreen(),
      Team(),
      Center(
        child: Text("Tournaments"),
      ),
    ];
    return Scaffold(
        drawer: CustomHomeDrawer(),
        bottomNavigationBar: Row(
          children: [
            BuildNavBar('assets/images/tournament.svg', 'assets/images/tournament.svg', 'الدورات',
                true, 2),
            BuildNavBar(
                'assets/images/team1.svg', 'assets/images/team1.svg', 'فريقك', true, 1),
            BuildNavBar('assets/images/HomeIcon1.svg', 'assets/images/HomeIcon2.svg', 'الرئيسية',
                true, 0),
          ],
        ),
        body: items[_currentIndex]);
  }

  Widget BuildNavBar(
      String icon1, String icon2, String name, bool isActive, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
          alignment: Alignment.center,
          height: 70,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 4,
                color: index == _currentIndex
                    ? Colors.blue
                    : Colors.transparent,
              ),
            ),
            color: Color(0xff1D1D1D),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              // index == _currentIndex
              //     ? SvgPicture.asset(
              //         icon1,
              //         color: index == _currentIndex
              //             ? Colors.blue
              //             : Colors.grey,
              //         width: 22,
              //         height: 25,
              //       )
              //     : SvgPicture.asset(
              //         icon2,
              //         color: index == _currentIndex
              //             ? primaryAppColor
              //             : Colors.grey,
              //         width: 22,
              //         height: 22,
              //       ),
              SizedBox(height: 5),
              Text(
                name,
                style: TextStyle(
                    color:
                        index == _currentIndex ? Colors.blue : Colors.grey,fontFamily: "Saira_Regular",fontSize: 13),
              )
            ],
          )),
    );
  }
}
