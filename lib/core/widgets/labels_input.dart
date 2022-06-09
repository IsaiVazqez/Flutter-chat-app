import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String subTitle;
  final String Title;
  final String ruta;

  const Labels(
      {Key? key,
      required this.ruta,
      required this.subTitle,
      required this.Title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        children: <Widget>[
          Text(subTitle,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 10),
          GestureDetector(
              child: Text(
                Title,
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, ruta);
              }),
        ],
      ),
    ));
  }
}
