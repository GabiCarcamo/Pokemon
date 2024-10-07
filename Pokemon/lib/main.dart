import 'package:flutter/material.dart';
import 'pagina/inicio.dart';
import 'pagina/detalle.dart';
import 'pagina/lista.dart';
import 'pagina/movimientos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PokeApp',
      theme: ThemeData(
        primaryColor: Color(0xffea07ff),
        appBarTheme: AppBarTheme(
          color: Color(0xffea07ff),
        ),
      ),
      home: Inicio(),
      routes: {
        '/pokemonList': (context) => lista(),
        '/pokemonDetail': (context) => detalle(),
        '/pokemonMoves': (context) => movimientos(),
      },
    );
  }
}
