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
      title: 'Aula Flutter',
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
                  onPressed: null,
                ));
          }),
    );
  }
}


/*void main() async {
    var url = Uri.http('localhost:3000', '/');
    var future = http.get(url);
    future.then((response){
      if(response.statusCode == 200){
        print('Página carregada!');
        print(response.body);
      }else{
        print('Erro');
      }
    });
}*/


/*
ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context,i){
          dynamic contato = lista[i];
          var avatar = CircleAvatar(backgroundImage: NetworkImage(contato['avatar']),);
          return ListTile(
              leading: avatar,
              title: Text(contato['nome']),
              subtitle: Text(contato['telefone']),
              trailing: Container(
                width: 100,
                child: Row(
                  children:[
                    IconButton(icon: Icon(Icons.edit),onPressed:null),
                    IconButton(icon: Icon(Icons.delete),onPressed:null),
                  ],
                ),
              ),
          );
        }),
    );
  }*/


  /*
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Comidas Lanchonete')
      ),
      body: ListView.builder(
        itemCount : comidas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              comidas[index].nome, 
              style: const TextStyle(
                fontSize: 20, 
                color: Colors.black
              )
            ),
            subtitle: Text(comidas[index].descricao.toString().substring(1, 30)+'...'),
            trailing: FloatingActionButton(
              child: Icon(Icons.add_shopping_cart),
              onPressed: null,
            )
          );
        }
      ),
    );
}
}*/