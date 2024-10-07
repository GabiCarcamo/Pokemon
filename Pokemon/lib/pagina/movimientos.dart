import 'package:flutter/material.dart';

class movimientos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> moves =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movimientos'),
        backgroundColor: Color(0xffea07ff),
      ),
      body: ListView.builder(
        itemCount: moves.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xffea07ff),
              child: Text(
                (index + 1).toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              moves[index]['move']['name'],
            ),
          );
        },
      ),
    );
  }
}
