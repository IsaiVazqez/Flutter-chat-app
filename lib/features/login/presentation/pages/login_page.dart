import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:chat/features/login/presentation/notifiers/show_alert.dart';
import 'package:chat/core/widgets/boton_azul.dart';
import 'package:chat/core/widgets/custom_input.dart';
import 'package:chat/core/widgets/labels_input.dart';
import 'package:chat/features/login/widgets/logo_login.dart';
import 'package:chat/core/bloc/auth_service.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Logo(
                    titulo: 'Messenger',
                  ),
                  _Form(),
                  Labels(
                    ruta: 'register',
                    subTitle: '¿No tienes Cuenta?',
                    Title: '¡Crea tu cuenta!',
                  ),
                  Text('Términos y condiciones de uso',
                      style: TextStyle(fontWeight: FontWeight.w400))
                ]),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrol = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail_lock_outlined,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrol,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            isPassword: true,
            textController: passCtrl,
          ),
          BotonAzull(
            text: 'Ingrese',
            onPressed: authService.autenticando
                ? () => {}
                : () async {
                    FocusScope.of(context).unfocus();

                    final loginOk = await authService.login(
                        emailCtrol.text.trim(), passCtrl.text.trim());

                    if (loginOk) {
                      // TODO: Conectar a nuestro socket server
                      Navigator.pushReplacementNamed(context, 'usuarios');
                    } else {
                      // Mostara alerta
                      mostrarAlerta(context, 'Login incorrecto',
                          'Revise sus credenciales');
                    }
                  },
          )
        ],
      ),
    );
  }
}
