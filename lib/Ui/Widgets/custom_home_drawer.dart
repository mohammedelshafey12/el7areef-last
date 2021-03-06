import 'package:el7areef/Ui/Screens/home_page.dart';
import 'package:el7areef/utils/colors_file.dart';
import 'package:el7areef/utils/navigator.dart';
import 'package:flutter/material.dart';

class CustomHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 30,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              onDetailsPressed: () => debugPrint('hello'),
              accountName: Text("Nader " "Salah"),
              accountEmail: Text("nadersalah20201111@gmail.com"),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/backGroundDrawer.jpg",
                    ),
                    alignment: Alignment(.5, 0),
                    fit: BoxFit.cover),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/playerImage.jpg"),
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              color: greyPrimaryColor,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home, color: whiteColor),
                    title: Text(
                      'الصفحة الرئيسية',
                      style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                    ),
                    onTap: () {
                      navigateAndClearStack(context, HomePage());
                    },
                  ),
                  ListTile(
                      leading: Icon(Icons.person, color: whiteColor),
                      title: Text(
                        'الصفحة الشخصية',
                        style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                      ),
                      onTap: () {
                      }),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.phone, color: whiteColor),
                    title: Text(
                      'اتصل بنا',
                      style: TextStyle(color:whiteColor,fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                    ),
                    onTap: () {
                      // launch("tel://5050");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: whiteColor),
                    title: Text(
                      'الاعدادات',
                      style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                    ),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help, color: whiteColor),
                    title: new RichText(
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'المساعدة',
                            style: new TextStyle(
                                color: whiteColor, fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: Colors.red),
                    title: Text(
                      'تسجيل الخروج',
                      style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Color(0xff1D1D1D),
                              title: Text("تسجيل الخروج",style: TextStyle(fontFamily: 'custom_font',color: Colors.white),),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              actions: [
                                FlatButton(onPressed: (){
                                  // auth.signout();
                                  // navigateAndClearStack(context, waitngWidget());
                                }, child: Text("تسجيل الخروج",style: TextStyle(fontFamily: 'custom_font'),)),
                                FlatButton(onPressed: (){

                                  Navigator.of(context).pop();
                                }, child: Text("الرجوع للتطبيق",style: TextStyle(fontFamily: 'custom_font'),))
                              ],
                              content: Container(
                                height: MediaQuery.of(context).size.height*0.15,
                                child: Center(
                                  child: Text("هل تريد فعلا تسجيل الخروج؟",style: TextStyle(fontFamily: 'custom_font',color: Colors.white),),
                                ),
                              ),
                            );
                          });

                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
