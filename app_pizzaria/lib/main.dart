import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'comida.dart';
//import 'http.dart';
import 'http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Pizzaria',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  var comidas = [];

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
      appBar: AppBar(title: const Text('Pizzaria')),
      body: ListView.builder(
          itemCount: comidas.length,
          itemBuilder: (context, index) {
            var foto = CircleAvatar(
              backgroundImage: NetworkImage(comidas[index].foto.toString()),
            );
            
            return ListTile(
                leading: foto,
                title: Text(comidas[index].nome,
                style: const TextStyle(fontSize: 20, color: Colors.black)),
                subtitle: Text(comidas[index].descricao.toString()),
                trailing: FloatingActionButton(
                  child: Icon(Icons.add_shopping_cart),
                  onPressed: (){
                    print('Id do item comprado: ${comidas[index].id}');
                    server_json.comprar(comidas[index].id);
                  }
                ));
          }),
    );
  }
}