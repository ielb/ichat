import 'package:ichat/src/services/api.dart';

class UserService extends Api {
  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await httpPost(
      endpoint: "login",
      body: {
        "email": email,
        "password": password,
      },
    );

    return response?.data;
  }

  Future<Map<String, dynamic>?> register(
      String email, String password, String name) async {
    final response = await httpPost(
      endpoint: "register",
      body: {
        "email": email,
        "password": password,
        "name": name,
      },
    );

    return response?.data;
  }

  Future<Map<String, dynamic>?> logout() async {
    final response = await httpPost(endpoint: "logout");

    return response?.data;
  }

  Future<Map<String, dynamic>?> getUser() async {
    final response = await httpGet(endpoint: "user");

    return response?.data;
  }

  Future<Map<String, dynamic>?> updateUser(
      {String? name, String? email, String? password}) async {
    final response = await httpPut(
      endpoint: "user",
      data: {
        "name": name,
        "email": email,
        "password": password,
      },
    );

    return response?.data;
  }
}
