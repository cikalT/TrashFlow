import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as HttpResponse;
import 'package:http/http.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/helpers/index.dart';
import 'package:trashflow/models/index.dart';
export 'dart:convert';

class Api extends BaseController {
  ResultApi resultApi = ResultApi()..success = false;
  String url = '';
  String msx = '';
  bool showFailMessage = true;

  var payload;
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  printError(dynamic e) {
    if (e != null && e.toString().toLowerCase().contains('api.')) {
      resultApi.message = 'There is problem on your connection';
    } else {
      resultApi.message = e.toString();
    }
    AlertHelper.showAlertError(e.toString(),
        title: 'Error Parsing API', alertType: AlertType.dialog);
    printDebugMode(e);
  }

  checkStatus200(HttpResponse.Response response) {
    bool doNext = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      doNext = true;
    }
    return doNext;
  }
}
