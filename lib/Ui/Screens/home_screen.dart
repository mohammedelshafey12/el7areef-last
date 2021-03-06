import 'package:carousel_slider/carousel_slider.dart';
import 'package:el7areef/utils/colors_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _postcontent;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getuserinfo();
  }
  final ScrollController _mycontroller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          backgroundColor: greyPrimaryColor,
          bottom: PreferredSize(
            preferredSize: Size.square(100),
            child: Container(
              // height: 200,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: whiteColor,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: whiteColor,
                              backgroundImage:
                                  AssetImage("assets/images/playerImage.jpg"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.notifications_active_sharp,
                              color: whiteColor,
                            ),
                          ],
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "?????? ??????????????????",
                              style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 25,
                                 ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: whiteColor, height: .8),
                      cursorColor: whiteColor,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(.1),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          hintText: '???????? ???? ??????????????????',
                          prefixIcon: Icon(
                            Icons.search,
                            color: whiteColor,
                          ),
                          hintStyle: TextStyle(
                              color: whiteColor.withOpacity(.5),
                              fontSize: 13)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
      backgroundColor: blackColor,
      body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              controller: _mycontroller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Form(
                          key: _globalKey,
                          child: TextFormField(
                            onSaved: (val) {
                              _postcontent = val;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "???? ???????? ???????? ????????...";
                              }
                            },
                            maxLines: 4,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: whiteColor, height: .8),
                            cursorColor: whiteColor,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(.1),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                                hintText: '. . . ???????? ?????? ????',
                                hintStyle: TextStyle(
                                    color: whiteColor.withOpacity(.5),
                                    fontFamily: 'custom_font',
                                    fontSize: 13)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: OutlineButton(
                            borderSide: BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              if (_globalKey.currentState.validate()) {
                                _globalKey.currentState.save();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Color(0xff1D1D1D),
                                        title: Text(
                                          "?????????? ?????????? ????????",
                                          style: TextStyle(
                                              fontFamily: 'custom_font',
                                              color: Colors.white),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        actions: [
                                          FlatButton(
                                              onPressed: () async {
                                                _globalKey.currentState.reset();
                                                DateTime postTime =
                                                    DateTime.now();
                                                // Store store = Store();
                                                // final FirebaseUser user =
                                                //     await _auth.currentUser();
                                                // final uid = user.uid;
                                                // Firestore.instance.collection(constants.usercollection).document(uid)
                                                //     .get().then((DocumentSnapshot) =>
                                                //     store.addPost(Post(_postcontent,postTime,uid,DocumentSnapshot.data[constants.username].toString()))
                                                //     //print(DocumentSnapshot.data[constants.username].toString())
                                                // );

                                                Navigator.of(context).pop();

                                                _scaffoldKey.currentState
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "???? ?????????? ?????????????? ??????????",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'custom_font')),
                                                  elevation: 2,
                                                ));
                                              },
                                              child: Text(
                                                "??????????",
                                                style: TextStyle(
                                                   ),
                                              )),
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "???????????? ??????????????",
                                                style: TextStyle(
                                                   ),
                                              ))
                                        ],
                                        content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          child: Center(
                                            child: Text(
                                              "???? ???????? ???????? ?????????? ?????? ??????????????..",
                                              style: TextStyle(
                                                  fontFamily: 'custom_font',
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              }
                            },
                            child: Text("??????????",
                                style: TextStyle(
                                  color: whiteColor.withOpacity(.5),
                                ))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "?????????????? ??????????",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 25,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
//                  Container(
//                    margin: EdgeInsets.only(left: 20),
//                    height: 167,
//                    width: MediaQuery.of(context).size.width,
//                    child: ListView.builder(
//                        scrollDirection: Axis.horizontal,
//                        itemCount: 5,
//                        itemBuilder: (BuildContext context, int index) {
//                          return InkWell(
//                            onTap: () {},
//                            child: Container(
//                              margin: EdgeInsets.only(right: 10),
//                              width: 200,
//                              // padding: EdgeInsets.only(right: 10),
//                              decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.circular(10),
//                                  image: DecorationImage(
//                                      image: AssetImage("images/carosal-1.jpg"),
//                                      fit: BoxFit.cover)),
//                            ),
//                          );
//                        }),
//                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "?????? ????????????????",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 25, ),
                        )),
                  ),

                  // PostsWidget(_mycontroller)
                ],
              ),
            ),
          ),
        ),

    );
  }

  // Future<void> getuserinfo() async {
  //   user = await _auth.currentUser();
  // }
}
