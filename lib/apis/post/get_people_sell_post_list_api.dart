import 'package:http/http.dart';
import 'package:trashflow/apis/api.dart';
import 'package:trashflow/configs/app_config.dart';
import 'package:trashflow/models/index.dart';

class GetPeopleSellPostListApi extends Api {
  String url = AppConfig.getApiUrl + '/post';

  Future<ResultApi> request() async {
    try {
      payload = {"type": "SELL"};
      await generateHeader();
      printDebugMode(url);
      printDebugMode(payload);
      var response = await get(
        Uri.parse(url),
        headers: headers,
      );

      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = GetPostListResponse.fromJson(responseBody);
        printDebugMode(responseBody);
        resultApi.success = true;
        resultApi.message = data.message;
        resultApi.listData = data.data;
      }
    } catch (e) {
      printDebugMode('error ya mas');
      printError(e);
    }
    return resultApi;
  }
}
