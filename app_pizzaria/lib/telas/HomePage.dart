import 'dart:convert';

import 'package:app_lanchonete/Rotas.dart';
import 'package:app_lanchonete/http.dart';
import 'package:app_lanchonete/telas/Carrinho.dart';
import 'package:app_lanchonete/telas/TelaLogin.dart';
import 'package:app_lanchonete/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:app_lanchonete/Compra.dart';
import '../comida.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  static String routeName = '/homepage';
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var comidas = [];
  static var id_car, nome_prod, desc, foto_img, valor_prod;
  @override
  void initState() {
    super.initState();

    Future.wait([
      shared_prefs.logado(),
      Future.delayed(Duration(seconds: 3)),
    ]).then((value) => value[2]
        ? Navigator.of(context).pushReplacementNamed('/homepage')
        : Navigator.of(context).pushReplacementNamed('/login'));
  }

  _getComidas() {
    server_json.listarComidas().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        comidas = lista.map((model) => Comida.fromJson(model)).toList();
      });
    });
  }

  HomePageState() {
    _getComidas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pizzaria'),
          automaticallyImplyLeading: false,
          //essa função acima remove o botão automatico de back das rotas.
          actions: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/carrinho');
                }),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                shared_prefs.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (_) => true);
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: comidas.length,
            itemBuilder: (context, index) {
              var produto = comidas[index];
              id_car = produto.id.toString();
              nome_prod = produto.nome.toString();
              desc = produto.descricao.toString();
              foto_img = produto.foto.toString();
              valor_prod = produto.valor.toString();

              var foto = CircleAvatar(
                backgroundImage: NetworkImage(produto.foto.toString()),
              );

              return ListTile(
                  leading: foto,
                  title: Text(comidas[index].nome,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black)),
                  subtitle: Text(comidas[index].descricao.toString()),
                  trailing: FloatingActionButton(
                      child: const Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        server_json.comprar(
                            id_car, nome_prod, desc, foto_img, valor_prod);
                      }));
            }));
  }
}
