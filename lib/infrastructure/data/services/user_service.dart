import 'package:standar_code_flutter/infrastructure/data/models/list_user_model.dart';
import 'package:standar_code_flutter/infrastructure/helpers/service_helper.dart';

class UserService {
  Future<ListUserModel> getListUser(String endpoint, String page) async {
    try {
      Map<String, dynamic> queryParam = {'page': page};
      final _service = ServiceHelper();
      final response =
          await _service.dio.get(endpoint, queryParameters: queryParam);
      return ListUserModel.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
