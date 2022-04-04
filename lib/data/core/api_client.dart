import 'dart:convert';
import 'package:http/http.dart';

class ApiClient{

  final Client _client;

  ApiClient(this._client);

  dynamic get(String apiPath) async {

    final response = await _client.get(Uri.parse(apiPath),
    headers: {
      'Content-Type': 'application/json',
    });

    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}