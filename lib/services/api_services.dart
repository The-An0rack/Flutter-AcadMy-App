// import 'dart:developer';

import 'dart:developer';

import 'package:http/http.dart' as http;

import '../data/api_data.dart';
import '../model/test_model.dart';

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
}
