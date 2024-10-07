import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        backgroundColor: Color(0xffea07ff),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.pexels.com/photos/4188296/pexels-photo-4188296.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Aquí va la URL de la imagen que mencionaste
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/pokemonList');
                  },
                  child: Text('INGRESAR'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffea07ff),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
