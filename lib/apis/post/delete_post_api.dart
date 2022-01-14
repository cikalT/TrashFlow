import 'package:http/http.dart';
import 'package:trashflow/apis/api.dart';
import 'package:trashflow/configs/app_config.dart';
import 'package:trashflow/models/index.dart';

class DeletePostApi extends Api {
  String url = AppConfig.getApiUrl + '/post';

  Future<ResultApi> request({
    required String postId,
  }) async {
    url += '/$postId';
    try {
      await generateHeader();
      printDebugMode(url);
      var response = await delete(Uri.parse(url), headers: headers);

      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = CreatePostResponse.fromJson(responseBody);
        printDebugMode(responseBody);
        resultApi.success = true;
        resultApi.message = data.message;
        // resultApi.data = data.data;
      }
    } catch (e) {
      printError(e);
    }
    return resultApi;
  }
}
