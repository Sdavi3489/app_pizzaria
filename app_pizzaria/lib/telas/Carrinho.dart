import 'dart:convert';
import 'dart:js_util';
import 'package:app_lanchonete/comida.dart';
import 'package:app_lanchonete/telas/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_lanchonete/Rotas.dart';
import 'package:app_lanchonete/http.dart';
import 'package:app_lanchonete/Compra.dart';

class Carrinho extends StatefulWidget {
  static String routeName = '/carrinho';

  @override
  State<Carrinho> createState() => CarrinhoState();
}

class CarrinhoState extends State<Carrinho> {
  //var carrinho = [];
  var carrinho = [
    {
      "id": "6",
      "nome": "Pizza de Chocolate com Banana",
      "descricao": "Banana, Chocolate, Leite Condensado",
      "foto":
          "https://image.shutterstock.com/image-photo/pizza-chocolate-bananas-260nw-1925441711.jpg",
      'valor': "50.00"
    }
  ];

  /*_get_compras() {
    /*String id_co = HomePageState.id_car;
    String nome_co = HomePageState.nome_prod;
    String descricao_co = HomePageState.desc;
    String foto_co = HomePageState.foto_img;
    String valor_co = HomePageState.valor_prod;
    String js_data =
        '{"id": ${id_co}, "nome": "${nome_co}", "descricao": "${descricao_co}", "foto": "${foto_co}", "valor": "${valor_co}"}';

    server_json
        .comprar(id_co, nome_co, descricao_co, foto_co, valor_co)
        .then((response) {
      setState(() {
        Iterable lista = json.decode(js_data);
        carrinho = lista.map((model) => Compra.fromJson(model)).toList();
      });
    });*/
  }

  CarrinhoState() {
    _get_compras();
  }*/

  /*@override
  void initState() {
    var id_co = HomePageState.id_car;
    var nome_co = HomePageState.nome_prod;
    var descricao_co = HomePageState.desc;
    var foto_co = HomePageState.foto_img;
    var valor_co = HomePageState.valor_prod;
    server_json
        .comprar(id_co, nome_co, descricao_co, foto_co, valor_co)
        .then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        carrinho = lista.map((model) => Compra.fromJson(model)).toList();
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: ListView.builder(
          itemCount: carrinho.length,
          itemBuilder: (context, index) {
            var car = carrinho[index];
            var foto = CircleAvatar(
              backgroundImage: NetworkImage(car['foto'].toString()),
            );

            return ListTile(
              leading: foto,
              title: Text(car['nome'].toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.black)),
              subtitle: Text(car['valor'].toString(),
                  style:
                      const TextStyle(fontSize: 20, color: Colors.lightGreen)),
            );
          }),
      persistentFooterButtons: [
        ElevatedButton(
            onPressed: () {},
            child: Text(
              'Finalizar compra',
            ))
      ],
    );
  }
}
//}

