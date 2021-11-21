// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tawsel_app/constants.dart';
// import 'package:tawsel_app/models/cartProductModel.dart';
// import 'package:tawsel_app/models/order_from_any_place_model.dart';
// import 'package:tawsel_app/models/user_model.dart';
// import 'package:tawsel_app/screens/home/home_screen.dart';

// class Store {
//   final fireStore = FirebaseFirestore.instance;

//   /// add user
//   Future addUser({
//     required UserModel userModel,
//     required context,
//   }) async {
//     var userDoc =
//         fireStore.collection(Constants.usersCollection).doc(userModel.userId);
//     userDoc.set(
//       {
//         Constants.userId: userModel.userId,
//         Constants.userName: userModel.userName,
//         Constants.userPhone: userModel.userPhone,
//         Constants.userAge: userModel.userAge,
//         Constants.userAddress: userModel.userAddress,
//         Constants.userImageUrl: userModel.userImageUrl,
//       },
//     ).then(
//       (value) {
//         Constants.navigatorPushAndRemove(
//           context: context,
//           screen: HomeScreen(),
//         );
//         Constants.scaffoldMessage(
//           context: context,
//           msg: 'تم اضافة بياناتك بنجاح',
//         );
//       },
//     );
//   }

//   /// edit user profile
//   Future editUserProfile({
//     required userId,
//     required userName,
//     required userAddress,
//     required userAge,
//     required userImageUrl,
//     required context,
//   }) async {
//     fireStore.collection(Constants.usersCollection).doc(userId).update(
//       {
//         Constants.userName: userName,
//         Constants.userAge: userAge,
//         Constants.userAddress: userAddress,
//         Constants.userImageUrl: userImageUrl,
//       },
//     ).then(
//       (value) {
//         Constants.navigatorPushAndRemove(
//           context: context,
//           screen: HomeScreen(),
//         );
//         Constants.scaffoldMessage(
//           context: context,
//           msg: 'تم تعديل بياناتك بنجاح',
//         );
//       },
//     );
//   }

//   Future uploadOrderFromAnyPlace({
//     required userId,
//     required userName,
//     required userPhone,
//     required OrderFromAnyPlaceModel orderFromAnyPlaceModel,
//   }) async {
//     var orderFromAnyPlaceDoc =
//         fireStore.collection(Constants.orderFromAnyPlaceCollection).doc();
//     orderFromAnyPlaceDoc.set(
//       {
//         Constants.orderFromAnyPlaceUserId: 'userName',
//         Constants.orderFromAnyPlaceUserName: userName,
//         Constants.orderFromAnyPlaceUserPhone: userPhone,
//         Constants.orderFromAnyPlaceId: orderFromAnyPlaceDoc.id,
//         Constants.orderFromAnyPlaceName: orderFromAnyPlaceModel.orderName,
//         Constants.orderFromAnyPlaceImageUrl:
//             orderFromAnyPlaceModel.orderImageUrl,
//         Constants.orderFromAnyPlaceAddress:
//             orderFromAnyPlaceModel.orderLocation,
//       },
//     );
//   }

//   Future uploadOrderFromCart({
//     required orderFromCartUserId,
//     required orderFromCartUserName,
//     required orderFromCartUserPhone,
//     required orderFromCartAddress,
//     required List<dynamic> cartList,
//   }) async {
//     var orderFromCart =
//         fireStore.collection(Constants.orderFromCartCollection).doc();
//     orderFromCart.set(
//       {
//         Constants.orderFromCartId: orderFromCart.id,
//         Constants.orderFromCartAddress: orderFromCartAddress,
//         Constants.orderFromCartUserId: orderFromCartUserId,
//         Constants.orderFromCartUserName: orderFromCartUserName,
//         Constants.orderFromCartUserPhone: orderFromCartUserPhone,
//       },
//     ).then(
//       (value) {
//         if (cartList.length != 0) {
//           for (var i = 0; i < cartList.length; i++) {
//             CartProductModel cartProductModel = cartList[i];
//             var orderFromCartOrders = fireStore
//                 .collection(Constants.orderFromCartCollection)
//                 .doc(orderFromCart.id)
//                 .collection(Constants.orderFromCartOrdersCollection)
//                 .doc();
//             orderFromCartOrders.set({
//               Constants.orderFromCartOrdersId: orderFromCartOrders.id,
//               Constants.orderFromCartOrdersName: cartProductModel.productName,
//               Constants.orderFromCartOrdersDescription:
//                   cartProductModel.productDescription,
//               Constants.orderFromCartOrdersImageUrl:
//                   cartProductModel.productImage,
//               'OrderFromCartOrdersCount': cartList[i].productDocId,
//               Constants.orderFromCartOrdersPrice: cartProductModel.productPrice,
//             });
//           }
//         }
//       },
//     );
//   }
// }
