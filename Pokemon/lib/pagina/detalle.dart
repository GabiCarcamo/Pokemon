import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class detalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String pokemonName =
        ModalRoute.of(context)!.settings.arguments as String;

    Future<Map<String, dynamic>> fetchPokemonDetail() async {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonName'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error al cargar detalles del Pokémon');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonName.toUpperCase()),
        backgroundColor: Color(0xffea07ff),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchPokemonDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final pokemon = snapshot.data!;
            final abilities = pokemon['abilities'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      pokemon['sprites']['other']['official-artwork']
                          ['front_default'],
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'HABILIDADES:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  for (var ability in abilities)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '- ' + ability['ability']['name'].toUpperCase(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/pokemonMoves',
                            arguments: pokemon['moves']);
                      },
                      child: Text('VER MOVIMIENTOS'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffea07ff),
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
