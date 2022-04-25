import 'package:flutter/material.dart';
import 'package:github_users/models/user_model.dart';

import '../exports.dart';

class HomeViewmodel with ChangeNotifier {
  HomeViewmodel() {
    getAllUsers();
  }
  ApiDataResponse<List<UserModel>> _userList = ApiDataResponse.idle();

  ApiDataResponse<List<UserModel>> get userList => _userList;

  set userList(ApiDataResponse<List<UserModel>> userList) {
    _userList = userList;
    notifyListeners();
  }

  getAllUsers() async {
    userList = ApiDataResponse.loading("loading");
    try {
      var users = await ApiClient().get("https://api.github.com/users");

      userList = ApiDataResponse.completed(userModelFromJson(users));
    } catch (e) {
      userList = ApiDataResponse.error(e.toString());
    }
  }
}
