// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';

// import 'package:tawsel_app/constants.dart';
// import 'package:tawsel_app/screens/auth/otpScreen.dart';
// import 'package:tawsel_app/screens/auth/sign_up_screen.dart';
// import 'package:tawsel_app/screens/home/home_screen.dart';

// class Auth {
//   static FirebaseAuth _auth = FirebaseAuth.instance;
//   static String? _verificationId;


//   // PhoneVerificationCompleted verificationCompleted =
//   //     (PhoneAuthCredential phoneAuthCredential) async {
//   //       final User? user = (await _auth.signInWithCredential(phoneAuthCredential)).user;
//   //       Constants.navigatorPushAndRemove(
//   //         context: context,
//   //         screen: SignUpScreen(
//   //           userPhone: user!.phoneNumber,
//   //         ),
//   //       );
//   //   await _auth.signInWithCredential(phoneAuthCredential);
//   //
//   // };
//   PhoneVerificationFailed verificationFailed =
//       (FirebaseAuthException authException) {};

//   Future phoneVerify({
//     required String phone,
//     required context,
//   }) async {
//     try {
//       Constants.dialogLoading(
//         context: context,
//         title: 'جاري التحقق من الرقم',
//       );

//       await _auth
//           .verifyPhoneNumber(
//         phoneNumber: "+2$phone",
//         timeout: const Duration(seconds: 30),
//         verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
//           final User? user = (await _auth.signInWithCredential(phoneAuthCredential)).user;
//           Constants.navigatorPushAndRemove(
//             context: context,
//             screen: SignUpScreen(
//               userPhone: user!.phoneNumber,
//             ),
//           );
//           await _auth.signInWithCredential(phoneAuthCredential);

//         },
//         verificationFailed: verificationFailed,
//         codeSent: (String verificationId, int? resendToken) {
//               print("${verificationId}/////////////////////////////////////////////////////////////////////");
//           _verificationId = verificationId;
//         },
//         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//       ).then(
//         (value) {
//           Timer(
//             Duration(seconds: 2),
//             () {
//               Constants.navigatorPushAndRemove(
//                 context: context,
//                 screen: OtpScreen(phone: phone,),
//               );
//             },
//           );
//         },
//       );
//     } catch (e) {
//       Navigator.pop(context);
//       Constants.scaffoldMessage(
//         context: context,
//         msg: e.toString(),
//       );
//     }
//   }

//   PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//       (String verificationId) {
//     _verificationId = verificationId;
//   };

//   Future signInWithPhoneNumber({
//     required context,
//     required String smsCode,
//     required phone,
//   }) async {
//     try {
//       Constants.dialogLoading(
//         context: context,
//         title: 'جاري التحقق من الكود',
//       );
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId!,
//         smsCode: smsCode,
//       );
//       final User? user = (await _auth.signInWithCredential(credential)).user;
//       Constants.navigatorPushAndRemove(
//         context: context,
//         screen: SignUpScreen(
//           userPhone: phone,
//         ),
//       );
//     } catch (e) {
//       Navigator.pop(context);
//       Constants.scaffoldMessage(
//         context: context,
//         msg: e.toString(),
//       );
//     }
//   }

//   /// sign out auth
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
