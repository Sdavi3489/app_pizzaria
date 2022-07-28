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
  var users = [server_json.user];
  //var js = json.decode(server_json.user);
  static var email;
  static var senha;

  /*_getuser() {
    server_json.login_user().then((response) {
      Iterable lista = json.decode(response.body);
      users = lista.map((model) => User.fromJson(model)).toList();
    });
  }*/

  /*_getusers() {
    server_json
        .add_user(
            //TelaRegistro.id,
            inputTextusername.username_controller.text.toString(),
            inputTextTelefone.tel_controller.text.toString(),
            inputTextEndereco.end_controller.text.toString(),
            inputText.login_controller.text.toString(),
            inputTextSenha.pass_controller.text.toString())
        .then((response) {
      Iterable lista = json.decode(response.body);
      users = lista.map((model) => User.fromJson(model)).toList();
    });
  }

  LoginController() {
    _getusers();
  }*/

  //String? _login;
  //setLogin(String value) => _login = value;
  //String? _pass;
  //setPass(String value) => _pass = value;

  Future<bool> autenticar() async {
    bool? sts;
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
