import 'package:http/http.dart' as http;

class server_json {
  static Future listarComidas() async {
    var url = Uri.http('localhost:8080', '/');
    //var url = Uri.http('10.0.2.2:8080', '/teste/listarbonecos');
    return await http.get(url);
  }
}
