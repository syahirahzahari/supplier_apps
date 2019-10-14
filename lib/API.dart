import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://staging.vectolabs.com";

class API {
  static Future getData() {
    var url = baseUrl + "/getdata";
    return http.get(url);
  }
}