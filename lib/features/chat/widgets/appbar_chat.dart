import 'package:flutter/material.dart';

class Appbarr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Column(
        children: <Widget>[
          CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 12)),
              backgroundColor: Colors.blue.shade600,
              maxRadius: 14),
          const SizedBox(
            height: 3,
          ),
          Text('Fracescaareds',
              style: TextStyle(color: Colors.black87, fontSize: 12))
        ],
      ),
      centerTitle: true,
      elevation: 1,
    );
  }
}
