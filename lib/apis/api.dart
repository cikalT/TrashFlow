import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as HttpResponse;
import 'package:http/http.dart';
import 'package:trashflow/helpers/index.dart';
import 'package:trashflow/models/index.dart';
export 'dart:convert';

class Api {
  ResultApi resultApi = ResultApi()..status = false;
  String url = '';
  String msx = '';
  bool showFailMessage = true;

  var payload;
  String accessToken = '';
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  printError(dynamic e) {
    if (e != null && e.toString().toLowerCase().contains('api.')) {
      resultApi.message =
          'Terjadi masalah, silahkan cek jaringan anda dan coba lagi';
    } else {
      resultApi.message = e.toString();
    }
    AlertHelper.showAlertError(e.toString(),
        title: 'Error Parsing API', alertType: AlertType.dialog);
  }

  checkResponse(HttpResponse.Response response) async {
    if (response.statusCode != 200) {
      if (!(Get.isSnackbarOpen)) {
        Get.snackbar('Error ${response.statusCode}', response.body,
            snackStyle: SnackStyle.FLOATING);
      }
    }
    String? message;
    if (response.statusCode != 500) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      message = responseBody.containsKey('message')
          ? responseBody['message'] is String
              ? responseBody['message']
              : null
          : null;
      if (responseBody.containsKey('message')) {
        if (responseBody['message'] is List<dynamic>) {
          List<dynamic> msgs = responseBody['message'];
          if (msgs.isNotEmpty) {
            message = msgs.first?.toString() ?? '';
          }
        } else {
          message = responseBody['message']?.toString();
        }
      }
      if (responseBody.containsKey('messages')) {
        if (responseBody['messages'] is List<dynamic>) {
          List<dynamic> msgs = responseBody['messages'];
          if (msgs.isNotEmpty) {
            message = msgs.first?.toString() ?? '';
          }
        } else {
          message = responseBody['messages']?.toString();
        }
      }
      if (message != null && message.toLowerCase().contains('api.')) {
        resultApi.message =
            'Terjadi masalah, silahkan cek jaringan anda dan coba lagi';
      } else {
        resultApi.message = message;
      }
    }
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 302 ||
        response.statusCode == 422 ||
        response.statusCode == 400) {
      //free to go
      //422 do validation in api class
      if (response.statusCode == 400 || response.statusCode == 302) {
        if (showFailMessage && response.statusCode == 400) {
          AlertHelper.showAlertError(message ?? '',
              alertType: AlertType.dialog);
        }
      }
    } else if (response.statusCode == 401
        //  ||
        //     (response.statusCode == 402 && message == "Unauthorized")
        ) {
    } else if (response.statusCode >= 500) {
      if (showFailMessage) {
        AlertHelper.showAlertError(
            'Coba ulangi beberapa saat lagi. ${kReleaseMode ? '' : runtimeType}',
            alertType: AlertType.snackBar,
            title: 'Terjadi Kesalahan');
      }
    } else {
      if (!kReleaseMode) {
        if (kDebugMode) {
          print(json.decode(response.body));
        }
      }
    }
  }

  checkStatus200(HttpResponse.Response response) {
    bool doNext = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      doNext = true;
    } else if (response.statusCode == 422) {
      var responseBody = json.decode(response.body);
      var data = ErrorLaravelResponse.fromJson(responseBody);
      resultApi.errors = data.data?.errors;
    }
    return doNext;
  }

  checkStatus200X(StreamedResponse response) async {
    bool doNext = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      msx = await response.stream.bytesToString();
      Map<String, dynamic> responseBody = json.decode(msx);
      String message =
          responseBody.containsKey('message') ? responseBody['message'] : '';
      List<dynamic> messages =
          responseBody.containsKey('messages') ? responseBody['messages'] : '';
      resultApi.message =
          messages.first != null ? messages.first.toString() : message;
      doNext = true;
    }
    return doNext;
  }
}
