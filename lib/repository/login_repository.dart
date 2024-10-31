// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:code/utils/api_url.dart';
// import 'package:code/widgets/my_progress_indicator.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// class LoginRepository {
//   Future<http.Response> login(
//       BuildContext context, String email, String password) async {
//     try {
//         String uri = "http://192.168.1.182/psits_api/login.php";
//         var res = await http.post(Uri.parse(uri), body: {
//           'email': email,
//           'password': password,
//         });

//         if (res.statusCode == 200) {
//           var response = jsonDecode(res.body);

//           if (response['success'] == true) {
//                 .setUserId(response['user_id']); //set the current user id
//             await loadingScreenModal(context, 2); // shows a loading
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder: (builder) => const MainPage()));
//           } else {
//             DInfo.dialogError(context, 'Incorrect username or password');
//             DInfo.closeDialog(context,
//                 durationBeforeClose: const Duration(seconds: 2));
//             // feedbackModal(
//             //     context, 'Incorrect username or password', Colors.red.shade400);
//           }
//         } else {
//           print('Bad request: ${res.statusCode}');
//         }
//       } catch (error) {
//         print("An error occurred: ${error}");
//         // Show a user-friendly error message for network or parsing errors
//         // Example: showError('An unexpected error occurred, please try again');
//       }
//   }
// }
