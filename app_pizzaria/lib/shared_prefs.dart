import 'dart:convert';
import 'package:app_lanchonete/telas/TelaRegistro.dart';
import 'package:app_lanchonete/user.dart';
import '../widgets/inputText_username.dart';
import 'widgets/inputText_app.dart';
import 'widgets/inputText_senha.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:app_lanchonete/http.dart';
import 'package:app_lanchonete/widgets/inputText_endereco.dart';
import 'package:app_lanchonete/widgets/inputText_telefone.dart';

class shared_prefs {
  static final String _key = 'key';

  static save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        _key,
        jsonEncode({
          "login": inputText.login_controller.text.toString(),
          "password": inputTextSenha.pass_controller.text.toString(),
          "logado": true
        }));
  }

  static Future<bool> logado() async {
    var prefs = await SharedPreferences.getInstance();
    final jsonResult = prefs.getString(_key);

    if (jsonResult != null) {
      var mapEmail = jsonDecode(jsonResult);
      return mapEmail['logado'];
    }
    return false;
  }

  static logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('login');
    await prefs.remove('password');
  }
}

class LoginController {
  ValueNotifier<bool> inloader = ValueNotifier<bool>(false);
  var users = [server_json.user];
  static var email;
  static var senha;

  Future<bool> autenticar() async {
    final prefs = await SharedPreferences.getInstance();
    final _login = prefs.getString('login') ??
        '${inputText.login_controller.text.toString()}';
    final _pass = prefs.getString('password') ??
        '${inputTextSenha.pass_controller.text.toString()}';
    inloader.value = true;
    await Future.delayed(Duration(seconds: 3));
    inloader.value = false;

    for (var i = 0; i <= users.length; i++) {
      email = users[i].contains(inputText.login_controller.text.toString());
      senha = users[i].contains(inputTextSenha.pass_controller.text.toString());
      print(users.last);
      return email && senha;
    }

    if (_login == email && _pass == senha) {
      print('login: $_login, pass: $_pass');
      shared_prefs.save();
      return true;
    }
    print('login: $_login, pass: $_pass');
    return false;
  }
}
