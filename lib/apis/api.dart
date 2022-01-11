import 'package:http/http.dart' as HttpResponse;
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/configs/shared_pref_config.dart';
import 'package:trashflow/helpers/alert_helper.dart';
import 'package:trashflow/models/index.dart';
export 'dart:convert';

class Api extends BaseController {
  ResultApi resultApi = ResultApi()..success = false;
  String url = '';
  String msx = '';
  bool showFailMessage = true;

  String accessEmail = '';
  var payload;
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  generateHeader({String? email}) async {
    var email = await SharedPrefConfig.getEmail();
    accessEmail = email;
    headers['email'] = email;
    printDebugMode(accessEmail);
  }

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
