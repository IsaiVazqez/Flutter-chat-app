import 'package:flutter/material.dart';

class BotonAzull extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  BotonAzull({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      elevation: 2,
      primary: Colors.blue,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const StadiumBorder());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 48,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
