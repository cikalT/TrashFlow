import 'dart:io';
import 'package:trashflow/apis/api.dart';
import 'package:trashflow/configs/app_config.dart';
import 'package:trashflow/configs/shared_pref_config.dart';
import 'package:trashflow/models/index.dart';
import 'package:http/http.dart' as http;

class CreatePostApi extends Api {
  String url = AppConfig.getApiUrl + '/post';

  Future<ResultApi> request({
    required String title,
    required String description,
    required int price,
    required String type,
    required String categories,
    required File image,
  }) async {
    try {
      headers['Content-Type'] = 'multipart/form-data';
      await generateHeader();
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);

      var multipartFile = http.MultipartFile.fromPath(
        'image',
        image.path,
      );
      request.files.add(await multipartFile);

      request.fields.addAll({
        "title": title,
        "description": description,
        "price": price.toString(),
        "type": type,
        "category_ids": categories,
      });
      http.StreamedResponse response = await request.send();
      String msx = '';
      msx = await response.stream.bytesToString();
      Map<String, dynamic> responseBody = json.decode(msx);
      var data = CreatePostResponse.fromJson(responseBody);
      printDebugMode(responseBody);
      resultApi.success = true;
      resultApi.message = data.message;
      resultApi.data = data.data;
    } catch (e) {
      // printError(e);
    }
    return resultApi;
  }
}
