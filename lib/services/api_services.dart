// import 'dart:developer';

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../data/api_data.dart';
import '../model/test_model.dart';
import '../model/user_profile.dart';

class ApiService {
  Future<List<Questions>?> getSubjectQuestions(int subjectCode) async {
    var client = http.Client();
    var url = Uri.parse(
        APIData.baseUrl + APIData.subjectTest + subjectCode.toString());
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var json = response.body;
        return questionsFromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<User?> getUserData(String email) async {
    var client = http.Client();
    var url = Uri.parse(APIData.baseUrl + APIData.getUser + email);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var json = response.body;
        return userFromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> postNewUser(
      String name, String email, List<String> courses) async {
    var client = http.Client();
    final queryParameters = {
      "name": name,
      "email": email,
      "courses": courses.toString(),
    };
    try {
      log("Making URI");
      var uri = Uri.parse(APIData.baseUrl + APIData.newUser);
      // var url = Uri.http( queryParameters);
      log("URI made");
      await http.post(uri,
          body: jsonEncode(<String, String>{
            "name": name,
            "email": email,
            "courses": courses.toString(),
          }),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          });
    } catch (e) {
      log(e.toString());
    }
  }
}
