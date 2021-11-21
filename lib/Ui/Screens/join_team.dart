import 'package:el7areef/utils/colors_file.dart';
import 'package:flutter/material.dart';


class JoinTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
          backgroundColor: greyPrimaryColor,
          bottom: PreferredSize(
            preferredSize: Size.square(20),
            child: Container(
              // height: 200,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "أنضم الي فريق",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 25,
                              fontFamily: 'custom_font'),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

        ],
      ),
    );
  }
}
