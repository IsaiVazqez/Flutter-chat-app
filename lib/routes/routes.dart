import 'package:flutter/material.dart';

import 'package:chat/features/chat/presentation/pages/chat_pages.dart';
import 'package:chat/features/login/presentation/pages/login_page.dart';
import 'package:chat/features/usuarios/pages/usuarios_page.dart';
import 'package:chat/features/loading/pages/loading_page.dart';
import 'package:chat/features/register/pages/register.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => Loginpage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};
