import 'package:standar_code_flutter/config/constant/api_constant.dart';
import 'package:standar_code_flutter/infrastructure/data/models/list_user_model.dart';
import 'package:standar_code_flutter/infrastructure/data/services/user_service.dart';

class UserRepository {
  final UserService _service = UserService();

  Future<ListUserModel> getListUser(String page) =>
      _service.getListUser(ApiConstant.apiListUser, page);
}
