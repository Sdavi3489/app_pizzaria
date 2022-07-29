import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;

// ignore: camel_case_types
class server_json {
  static var compras;
  static var user;

  static Future listarComidas() async {
    var url = Uri.http('localhost:8080', '/homepage');
    //var url = Uri.http('192.168.1.67:53272', '/');
    return await http.get(url);
  }

  static Future comprar(String id, String nome, String descricao, String foto,
      String valor) async {
    Map data = {
      'id': '$id',
      'nome': '$nome',
      'descricao': '$descricao',
      'foto': '$foto',
      'valor': '$valor'
    };

    var body = json.encode(data);

    var url = Uri.http('localhost:8080', '/comprar');
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json"
        },
        body: body);
    print(response.body);
    compras = response.body;
  }

  static Future add_user(String nome, String telefone, String endereco,
      String email, String senha) async {
    var url =
        Uri.http('localhost:8080', '/$nome/$telefone/$endereco/$email/$senha');
    var response = await http.post(url, body: {
      //'id': id,
      'nome': nome,
      'telefone': telefone,
      'endereco': endereco,
      'email': email,
      'senha': senha
    });

    user = response.body;
    print(response.body);
  }
}


  /*static Future comprar(
      int id, String nome, String descricao, String foto, String valor) async {
    var url = Uri.http(
        'localhost:8080', '/comprar/$id/$nome/$descricao/$foto/$valor');
    var response = await http.post(url, body: {
      'id': '$id',
      'nome': '$nome',
      'descricao': '$descricao',
      'foto': '$foto',
      'valor': '$valor'
    });
    compras.add(response.body);
    // ignore: avoid_print
    print(response.body);
  }*/

  /*static Future comprar(int id) async {
    var url = Uri.http('localhost:8080', '/comprar/$id');
    var response = await http.post(url, body: {'id': '$id'});
    // ignore: avoid_print
    print(response.body);
  }*/

/*

  static Future add_user(String nome, String telefone, String endereco,
      String email, String senha) async {
    final id = Random().nextDouble().toString();
    var url = Uri.http(
        'localhost:8080', '/$id/$nome/$telefone/$endereco/$email/$senha');
    var response = await http.post(url, body: {
      'id': '$id',
      'nome': '$nome',
      'telefone': '$telefone',
      'endereco': '$endereco',
      'email': '$email',
      'senha': '$senha'
    });
    // ignore: avoid_print
    print(response.body);
  }
*/

  /*static Future comprar(
      int id, String nome, String descricao, String foto, String valor) async {
    var url = Uri.http(
        'localhost:8080', '/comprar/$id/$nome/$descricao/$foto/$valor');
    var response = await http.post(url, body: {
      'id': '$id',
      'nome': '$nome',
      'descricao': '$descricao',
      'foto': '$foto',
      'valor': '$valor'
    });
    //compras.add(response.body);
    // ignore: avoid_print
    compras = response.body;
  }*/