import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String? texto;
  final String? uid;
  final AnimationController animationController;
  const ChatMessage(
      {Key? key, this.texto, this.uid, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: animationController, curve: Curves.elasticOut),
        child: Container(
          child: uid == '123' ? _MyMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _MyMessage() {
    return Align(
        alignment: Alignment.centerRight,
        child: FadeTransition(
          opacity: animationController,
          child: Container(
            margin: EdgeInsets.only(bottom: 7, left: 50, right: 5),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(0xff4D9EF6),
                borderRadius: BorderRadius.circular(20)),
            child: Text(texto!),
          ),
        ));
  }

  Widget _notMyMessage() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(bottom: 7, right: 50, left: 5),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffE4E5E8),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            texto!,
            style: TextStyle(color: Colors.black87),
          ),
        ));
  }
}
