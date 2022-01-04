import 'package:http/http.dart';
import 'package:trashflow/apis/api.dart';
import 'package:trashflow/configs/app_config.dart';
import 'package:trashflow/models/index.dart';

class InsertProfileApi extends Api {
  String url = AppConfig.getApiUrl + '/user';

  Future<ResultApi> request({
    required String email,
    required String address,
    required String image,
    required String phone,
    required int latitude,
    required int longitude,
  }) async {
    payload = {
      "email": email,
      "address": address,
      "image": image,
      "phone": phone,
      "latitude": latitude,
      "longitude": longitude,
    };
    printDebugMode(payload);
    try {
      var response = await post(Uri.parse(url),
          body: json.encode(payload), headers: headers);

      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = GetProfileResponse.fromJson(responseBody);
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
