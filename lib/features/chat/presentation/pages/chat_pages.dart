import 'dart:io';

import 'package:chat/features/chat/widgets/appbar_chat.dart';
import 'package:chat/features/chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];

  bool _estaEscribiendo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(57.0), child: Appbarr()),
        body: Container(
          child: Column(children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              ),
            ),
            Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              height: 50,
              child: _inputChat(),
            )
          ]),
        ));
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                      controller: _textController,
                      onSubmitted: _handleSubmit,
                      onChanged: (text) {
                        setState(() {
                          if (text.trim().length > 0) {
                            _estaEscribiendo = true;
                          } else {
                            _estaEscribiendo = false;
                          }
                        });
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Enviar Mensaje',
                      ),
                      focusNode: _focusNode),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: Platform.isIOS
                      ? CupertinoButton(
                          child: Text('Enviar'),
                          onPressed: _estaEscribiendo
                              ? () => _handleSubmit(_textController.text.trim())
                              : null)
                      : Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          child: IconTheme(
                            data: IconThemeData(color: Colors.blue.shade400),
                            child: IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                icon: Icon(
                                  Icons.send,
                                ),
                                onPressed: _estaEscribiendo
                                    ? () => _handleSubmit(
                                        _textController.text.trim())
                                    : null),
                          ),
                        ),
                )
              ],
            )));
  }

  _handleSubmit(String texto) {
    if (texto.length == 0) return;
    print(texto);

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      uid: '123',
      texto: texto,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 400)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    // TODO: implement dispose
    super.dispose();
  }
}
