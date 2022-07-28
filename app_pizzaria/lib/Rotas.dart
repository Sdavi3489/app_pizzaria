import 'package:app_lanchonete/telas/HomePage.dart';
import 'package:app_lanchonete/telas/TelaLogin.dart';
import 'package:app_lanchonete/telas/TelaRegistro.dart';
import 'package:app_lanchonete/telas/Carrinho.dart';

var rotas = {
  // ignore: prefer_const_constructors
  TelaLogin.routeName: (context) => TelaLogin(),
  // ignore: prefer_const_constructors
  TelaRegistro.routeName: (context) => TelaRegistro(),
  HomePage.routeName: (context) => HomePage(),
  Carrinho.routeName: (context) => Carrinho()
};
