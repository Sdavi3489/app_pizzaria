//tela registro

// ignore: file_names
// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:convert';
import 'dart:math';

import 'package:app_lanchonete/widgets/inputText_endereco.dart';
import 'package:app_lanchonete/widgets/inputText_telefone.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../user.dart';
import '../widgets/inputText_app.dart';
import '../widgets/inputText_senha.dart';
import '../widgets/titulo_app.dart';
import '../widgets/inputText_username.dart';
import 'package:app_lanchonete/http.dart';

class TelaRegistro extends StatelessWidget {
  static String routeName = '/registrar';
  // ignore: prefer_const_constructors_in_immutables
  TelaRegistro({super.key});
  static var users = [];

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
            // ignore: prefer_const_constructors
            constraints: BoxConstraints(maxWidth: 400),
            child: Container(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                // ignore: prefer_const_constructors
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              child: Wrap(
                runSpacing: 20,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: titulo_app(
                        'Nova Conta',
                        textAlign: TextAlign.center,
                      )),
                  inputTextusername(placeholder: 'Nome'),
                  inputTextTelefone(placeholder: 'Telefone'),
                  inputTextEndereco(placeholder: 'Endereço'),
                  inputText(placeholder: 'Email'),
                  inputTextSenha(placeholder: 'Senha'),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          server_json.add_user(
                              inputTextusername.username_controller.text
                                  .toString(),
                              inputTextTelefone.tel_controller.text.toString(),
                              inputTextEndereco.end_controller.text.toString(),
                              inputText.login_controller.text.toString(),
                              inputTextSenha.pass_controller.text.toString());
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
                        child: Text('Criar Conta')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Já tem uma conta?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/login',
                            );
                          },
                          child: Text(
                            'Entrar',
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
