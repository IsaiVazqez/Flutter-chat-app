import 'package:chat/features/usuarios/domain/entities/usuario.dart';
import 'package:flutter/material.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(uid: '1', nombre: 'maría', email: 'test1Qgmail.com', online: true),
    Usuario(
        uid: '2', nombre: 'Francesca', email: 'test2Qgmail.com', online: false),
    Usuario(uid: '2', nombre: 'Isaí', email: 'test3Qgmail.com', online: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil', style: TextStyle(color: Colors.black87)),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app, color: Colors.black87),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.check_circle, color: Colors.blue[400]),
            )
          ],
        ),
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (_, i) => ListTile(
              title: Text(usuarios[i].nombre!),
              leading: CircleAvatar(
                child: Text(usuarios[1].nombre!.substring(0, 2)),
              ),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: usuarios[1].online! ? Colors.green[300] : Colors.red,
                    borderRadius: BorderRadius.circular(100)),
              )),
          separatorBuilder: (_, i) => Divider(),
          itemCount: usuarios.length,
        ));
  }
}
