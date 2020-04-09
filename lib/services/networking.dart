import 'package:http/http.dart' as http;
import 'dart:convert';

class GetDataUseCase {

  GetDataUseCase({this.url});

  String url;

  Future<dynamic> invoke() async {
    var response = await http.get(
        url
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
//      var temp = jsonData['main']['temp'];
//      var city = jsonData['name'];
//      var condition = jsonData['weather'][0]['id'];
//      print(temp);
//      print(city);
//      print(condition);
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  }

}