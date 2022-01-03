import 'package:http/http.dart';
import 'package:trashflow/apis/api.dart';
import 'package:trashflow/configs/app_config.dart';
import 'package:trashflow/helpers/index.dart';
import 'package:trashflow/models/index.dart';

class InsertProfileApi extends Api {
  String url = AppConfig.getApiUrl + '/user';

  Future<ResultApi> request({
    required String email,
  }) async {
    payload = {
      "email": email,
    };
    UtilHelper.printDebugMode(payload);
    try {
      var response = await post(Uri.parse(url),
          body: json.encode(payload), headers: headers);

      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = GetProfileResponse.fromJson(responseBody);
        UtilHelper.printDebugMode(responseBody);
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
