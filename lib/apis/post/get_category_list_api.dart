import 'package:http/http.dart';
import 'package:trashflow/apis/api.dart';
import 'package:trashflow/configs/app_config.dart';
import 'package:trashflow/models/index.dart';

class GetCategoryListApi extends Api {
  String url = AppConfig.getApiUrl + '/category';

  Future<ResultApi> request() async {
    printDebugMode(payload);
    try {
      await generateHeader();
      var response = await get(
        Uri.parse(url),
        headers: headers,
      );

      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = GetCategoryListResponse.fromJson(responseBody);
        printDebugMode(responseBody);
        resultApi.success = true;
        resultApi.message = data.message;
        resultApi.listData = data.data;
      }
    } catch (e) {
      printError(e);
    }
    return resultApi;
  }
}
