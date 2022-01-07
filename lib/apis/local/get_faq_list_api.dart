import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:trashflow/apis/api.dart';
import 'package:trashflow/configs/app_config.dart';
import 'package:trashflow/models/index.dart';

class GetFaqListLocalApi extends Api {
  Future<ResultApi> request() async {
    var dataJson = await rootBundle.loadString('assets/jsons/faq_list.json');
    var responseBody = json.decode(dataJson);
    printDebugMode(responseBody);
    var data = GetFqaListResponse.fromJson(responseBody);
    resultApi.success = true;
    resultApi.message = data.message;
    resultApi.listData = data.data;
    return resultApi;
  }
}
