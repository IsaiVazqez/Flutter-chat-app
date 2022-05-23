import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        children: <Widget>[
          Text('¿No tienes cuenta?',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w400)),
          SizedBox(height: 10),
          Text('¡Crea tu cuenta!',
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ));
  }
}
