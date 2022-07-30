//tela login
// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'package:app_lanchonete/telas/TelaRegistro.dart';
import 'package:flutter/material.dart';
import '../widgets/inputText_app.dart';
import '../widgets/inputText_senha.dart';
import '../widgets/titulo_app.dart';
import '../shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_lanchonete/http.dart';

class TelaLogin extends StatelessWidget {
  static String routeName = '/login';
  // ignore: prefer_const_constructors_in_immutables
  TelaLogin({super.key});

  LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color(0xff161E2E),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 400,
              maxWidth: 400,
            ),
            child: Container(
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              child: Wrap(
                runSpacing: 20,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: titulo_app(
                        'Login',
                        textAlign: TextAlign.center,
                      )),
                  inputText(placeholder: 'Email'),
                  inputTextSenha(placeholder: 'Senha'),
                  //width: double.infinity,
                  ValueListenableBuilder<bool>(
                    valueListenable: _controller.inloader,
                    builder: (_, inLoader, __) => inLoader
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              _controller.autenticar().then((result) {
                                if (result) {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/homepage');
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Text('Falha no login!'),
                                    duration: const Duration(seconds: 5),
                                  ));
                                }
                              });
                            },
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10,
                                ),
                                textStyle: TextStyle(fontSize: 16),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            child: Text('Entrar')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Não tem uma conta?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              TelaRegistro.routeName,
                            );
                          },
                          child: Text(
                            'Criar conta',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
