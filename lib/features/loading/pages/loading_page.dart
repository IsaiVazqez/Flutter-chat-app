import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/core/bloc/socket_service.dart';
import 'package:chat/core/bloc/auth_service.dart';
import 'package:chat/features/login/presentation/pages/login_page.dart';
import 'package:chat/features/usuarios/pages/usuarios_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return const Center(
            child: const Text('Espere...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final socketService = Provider.of<SocketService>(context);

    final authService = Provider.of<AuthService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    if (autenticado) {
      socketService.connect();
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => const UsuariosPage(),
              transitionDuration: const Duration(milliseconds: 0)));
    } else {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => const Loginpage(),
              transitionDuration: const Duration(milliseconds: 0)));
    }
  }
}
