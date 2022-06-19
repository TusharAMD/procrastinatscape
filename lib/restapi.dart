import 'api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestAPI{
  Future<List<Api>?> getPosts() async{
    var client = http.Client();

    var uri =  Uri.parse("https://procrastinatscape.herokuapp.com/getCards");
    var response = await client.get(uri);
    if (response.statusCode==200){
      var json = response.body;
      return apiFromJson(json);
    }
  }
}