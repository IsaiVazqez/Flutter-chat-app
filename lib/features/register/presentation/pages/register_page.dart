import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:chat/features/login/widgets/logo_login.dart';
import 'package:chat/core/bloc/auth_service.dart';
import 'package:chat/core/widgets/boton_azul.dart';
import 'package:chat/core/widgets/custom_input.dart';
import 'package:chat/core/widgets/labels_input.dart';
import 'package:chat/features/login/presentation/notifiers/show_alert.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                    titulo: 'Registro',
                  ),
                  _Form(),
                  Labels(
                    ruta: 'login',
                    subTitle: '¿Tienes Cuenta?',
                    Title: '¡Inicia Sesión!',
                  ),
                  SizedBox(height: 5),
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
  final nameCtrol = TextEditingController();
  final emailCtrol = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.person,
            placeholder: 'Nombre',
            keyboardType: TextInputType.name,
            textController: nameCtrol,
          ),
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
                    print(nameCtrol.text);
                    print(emailCtrol.text);
                    print(passCtrl.text);
                    final registroOk = await authService.register(
                        nameCtrol.text.trim(),
                        emailCtrol.text.trim(),
                        passCtrl.text.trim());

                    if (registroOk == true) {
                      //  TODO: Conectar socket server
                      Navigator.pushReplacementNamed(context, 'usuarios');
                    } else {
                      mostrarAlerta(context, 'Registro incorrecto',
                          registroOk.toString());
                    }
                  },
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
