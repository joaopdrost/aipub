import 'package:app/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/assets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: const Color(0xff151316),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: <Widget>[
                 FractionallySizedBox(
                  widthFactor: 0.85,
                  child: AspectRatio(
                    aspectRatio:
                        1, 
                    child: Image(
                      image: AssetImage(Assets.logo),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                 Text.rich(TextSpan(
                    text: 'Cadastre-se',
                    style: TextStyle(
                      color: Styles.primary,
                      fontFamily: 'Poppins',
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ))),
                 TextField(
                  style: TextStyle(color: Styles.backgroud),
                  maxLength: 32,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      hintStyle: TextStyle(color: Styles.backgroud),
                      hintText: 'Nome de Usuário'),
                ),
                 TextField(
                  style: TextStyle(color: Styles.backgroud),
                  maxLength: 32,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.email),
                      hintStyle: TextStyle(color: Styles.backgroud),
                      hintText: 'E-mail'),
                ),
                TextFormField(
                  style:  TextStyle(color: Styles.backgroud),
                  maxLength: 16,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.key),
                    hintStyle: TextStyle(color: Styles.backgroud),
                    hintText: 'Senha',
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Styles.backgroud,
                      ),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _showPassword == false ? true : false,
                ),
                TextFormField(
                  style:  TextStyle(color: Styles.backgroud),
                  maxLength: 16,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.key),
                    hintStyle: TextStyle(color: Styles.backgroud),
                    hintText: 'Confirmar senha',
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Styles.backgroud,
                      ),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _showPassword == false ? true : false,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Styles.accent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(color: Colors.white))),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color(0xff151316)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: const BorderSide(color: Colors.white))),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Já tem conta? faça login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}