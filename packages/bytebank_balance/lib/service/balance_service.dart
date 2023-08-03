import 'dart:convert';
import 'package:http/http.dart' as http;

class BalanceService {
  String url = "http://10.0.2.2:3000/balance";

  Future<bool> hasPin({required String userId}) async {
    http.Response response = await http.post(
      Uri.parse("$url/has-pin"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(
        {
          "userId": userId,
        },
      ),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)["hasPin"];
    }

    //TODO: Lançar erro
    return false;
  }

  Future<double> createPin({
    required String userId,
    required String pin,
  }) async {
    http.Response response = await http.post(
      Uri.parse("$url/create-pin"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "userId": userId,
        "newPin": pin,
      }),
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body)["balance"] as int).toDouble();
    }

    //TODO: Lançar erro
    return -1;
  }

  Future<double> getBalance({
    required String userId,
    required String pin,
  }) async {
    http.Response response = await http.post(
      Uri.parse("$url/user-balance"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "userId": userId,
        "pin": pin,
      }),
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body)["balance"] as int).toDouble();
    }

    //TODO: Lançar erro
    return -1;
  }
}
