import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:constructionguide/prefmanager/Prefmanager.dart';
import 'package:http/http.dart' as http;

class WebClient {
  static const baseUrl = "http://apicerp.leopardtechlabs.in";

  static const imageUrl = "https://parishprojects.herokuapp.com/file/get/";

  static Future<dynamic> post(url, data) async {
    var token;
    // await PrefManager.getToken();
    // print(token + "ddd");
    Map? sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }
    var body = json.encode(sendData);
    var response = await http.post(
      Uri.parse(baseUrl + url),
      headers: {"Content-Type": "application/json", "token": token ?? ""},
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };

      return error;
    }
  }

  static Future<dynamic> get(url) async {
    String token = await PrefManager.getToken();
    log(token.toString());
    var response = await http.get(Uri.parse(baseUrl + url),
        headers: {"Content-Type": "application/json", "token": token ?? ""});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }
}
