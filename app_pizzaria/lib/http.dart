import 'package:http/http.dart' as http;

class server_json {
  static Future listarComidas() async {
    var url = Uri.http('localhost:8080', '/');
    //var url = Uri.http('192.168.1.67:53272', '/');
    return await http.get(url);
  }

  /*static Future comprar(int id) async {
    var url = Uri.http('localhost:8080', '/comprar');
    return await http.post(url, body: {'id': '$id'});
  }*/
}