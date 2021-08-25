//import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:convert';
import 'dart:async';
import 'package:login_system/Modules/login_module.dart';
import 'package:login_system/Screens/Lang_Screen.dart';


Future<LoginModule> signIn(String email, String password) async {
  final response = await http.post(
    Uri.parse('https://test.snawnaw.com/public/api/login'),
    body: jsonEncode(<String, String>{
      'email': email,
      'password' : password
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return LoginModule.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}



// class LoginSystem{
//   Future getLoginUser(String email, String password) async{
//     String url = 'https://test.snawnaw.com/public/api/login';
//     Map Body = {
//       "email": email,
//       "password": password
//     };
//     EasyLoading.show(status: 'loading...');
//     try{
//       // var response = await http.post(Uri.parse(url,body: Body));
//       var readyUrl = Uri.parse(url);
//       var response = await http.post(
//           readyUrl,
//         body: jsonEncode(<String, String>{
//           "email": email,
//           "password": password
//         }),
//       );
//       var jsonResponse = json.decode(response.body);
//       return jsonResponse;
//
//     }
//     catch(e){
//       EasyLoading.showError('Failed with Error');
//     }
//     EasyLoading.dismiss();
//   }
// }