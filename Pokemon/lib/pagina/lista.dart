import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class lista extends StatelessWidget {
  Future<List<dynamic>> fetchPokemon() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('Error al cargar Pokémon');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeApp'),
        backgroundColor: Color(0xffea07ff),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchPokemon(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final pokemonList = snapshot.data!;
            return ListView.builder(
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      leading: Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        pokemon['name'].toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/pokemonDetail',
                          arguments: pokemon['name'],
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
