import 'dart:convert';
import 'widgets/inputText_app.dart';
import 'widgets/inputText_senha.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

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
    //prefs.setString('login', inputText.login_controller.text.toString());
    //prefs.setString('password', inputTextSenha.pass_controller.text.toString());
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

  /*static Future<bool> auth() async {
    final prefs = await SharedPreferences.getInstance();
    var validate = prefs.getString('login') ??
        '${inputText.login_controller.text.toString()}';
    if (validate != null) {
      print(
          "User Logged in!!! ->  Login: ${prefs.get('login')}  Password: ${prefs.get('password')}");
      return true;
    }
    return false;
  }*/

  static logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('login');
    await prefs.remove('password');
  }
}

/*class shared_prefs {
  static final String _key = 'key';

  //salvar usuário
  static save(String login) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode({"login": login, "logado": true}));
  }

  // Verfica se está autenticado
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
    await prefs.remove(_key);
  }
}
*/

class LoginController {
  ValueNotifier<bool> inloader = ValueNotifier<bool>(false);

  //String? _login;
  //setLogin(String value) => _login = value;
  //String? _pass;
  //setPass(String value) => _pass = value;

  Future<bool> autenticar() async {
    final prefs = await SharedPreferences.getInstance();
    final _login = prefs.getString('login') ??
        '${inputText.login_controller.text.toString()}';
    final _pass = prefs.getString('password') ??
        '${inputTextSenha.pass_controller.text.toString()}';
    inloader.value = true;
    await Future.delayed(Duration(seconds: 3));
    inloader.value = false;
    if (_login == 'admin' && _pass == '123') {
      print('login: $_login, pass: $_pass');
      shared_prefs.save();
      return true;
    }
    print('login: $_login, pass: $_pass');
    return false;
  }
}
