

import 'package:app_lanchonete/telas/HomePage.dart';
import 'package:app_lanchonete/telas/TelaLogin.dart';
import 'package:app_lanchonete/telas/TelaRegistro.dart';

var rotas = {
  // ignore: prefer_const_constructors
  TelaLogin.routeName: (context) => TelaLogin(),
  // ignore: prefer_const_constructors
  TelaRegistro.routeName: (context) => TelaRegistro(),
  HomePage.routeName: (context) => HomePage()
};
