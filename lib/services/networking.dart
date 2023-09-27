import 'dart:convert';
import 'package:http/http.dart' ;

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  Future getData() async {
   Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      throw (response.statusCode);
    }
  }
}
