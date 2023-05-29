import 'package:dio/dio.dart';
import 'package:res_api/core/config/dio_config.dart';
import 'package:res_api/core/constant/project_url.dart';

class GetUserService {
  static Future<dynamic> getUser() async {
    try {
      Response response = await DioConfig.createRequest().get(ProjectUrl.users);
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else if (response.statusCode == 401) {
        print("${response.statusCode} ${response.statusMessage}");
        return "${response.statusCode} ${response.statusMessage}";
      } else {
        print(response.statusMessage);
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectionTimeout:
          print("Connection timeout");
          break;
        case DioErrorType.receiveTimeout:
          print("Receive timeout");
          break;
        case DioErrorType.sendTimeout:
          print("Send timeout");
          break;
        default:
          print("Unknown error type");
      }
    }
  }
}
