import 'dart:io';

import 'package:http/http.dart';
import 'package:trashflow/apis/api.dart';
import 'package:trashflow/configs/app_config.dart';
import 'package:trashflow/models/index.dart';

class CreatePostApi extends Api {
  String url = AppConfig.getApiUrl + '/post';

  Future<ResultApi> request({
    required String email,
    required String title,
    required String description,
    required int price,
    required String type,
    required String categories,
    required File image,
  }) async {
    payload = {
      "title": title,
      "description": description,
      "price": price,
      "type": type,
      "categories": categories,
      "image": image,
    };
    printDebugMode(payload);
    try {
      await generateHeader();
      var response = await post(Uri.parse(url),
          body: json.encode(payload), headers: headers);

      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = CreatePostResponse.fromJson(responseBody);
        printDebugMode(responseBody);
        resultApi.success = true;
        resultApi.message = data.message;
        resultApi.data = data.data;
      }
    } catch (e) {
      printError(e);
    }
    return resultApi;
  }
}
