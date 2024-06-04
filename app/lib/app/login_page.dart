import 'package:app/shared/assets.dart';
import 'package:app/shared/routes.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/category_store.dart';
import 'package:app/store/product_store.dart';
import 'package:app/store/user_store.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  late ProductStore storeProduct;
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    UserStore store = Provider.of<UserStore>(context);
    CategoryStore storeCategory = Provider.of<CategoryStore>(context);
    ProductStore storeProduct = Provider.of<ProductStore>(context);

    return Scaffold(
      backgroundColor: const Color(0xff151316),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: <Widget>[
               FractionallySizedBox(
                widthFactor: 0.85, 
                child: AspectRatio(
                  aspectRatio: 1, 
                  child: Image(
                    image: AssetImage(Assets.logo),
                    fit: BoxFit.fitWidth,
                  ).animate().shimmer(
                    duration: 800.ms,
                    delay: 1.seconds,
                   
                  ),
                ),
              ),
              Text.rich(TextSpan(
                  text: 'Seja bem-vindo',
                  style: TextStyle(
                    color: Styles.primary,
                    fontFamily: 'Poppins',
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ))),
              TextFormField(
                controller: _user,
                style: TextStyle(color: Styles.backgroud),
                maxLength: 32,
                decoration: InputDecoration(
                    focusColor: Styles.backgroud,
                    fillColor: Styles.backgroud,
                    icon: const Icon(Icons.person),
                    hintStyle: TextStyle(color: Styles.backgroud),
                    hintText: 'Nome de Usuário'),
              ),
              TextFormField(
                controller: _pass,
                style: TextStyle(color: Styles.backgroud),
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
              AnimatedBuilder(
                  animation: store,
                  builder: (context, _) {
                    if (store.error != null) {
                      return Text(store.error!);
                    }

                    if (store.isLoading) {
                      return CircularProgressIndicator(
                        color: Styles.primary,
                      );
                    }

                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Styles.accent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side:
                                           BorderSide(color: Styles.backgroud))),
                        ),
                        onPressed: () {
                          storeCategory.category(_user.text, _pass.text);
                          storeProduct.product(_user.text, _pass.text);
                          store.login(
                            _user.text,
                            _pass.text,
                            ()=>
                      
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.home, (route) => false)
                          );
                        },
                        child:  Text(
                          'Login',
                          style: TextStyle(color: Styles.backgroud),
                        ),
                      ),
                    );
                  }),
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
                    onPressed:
                        () {Navigator.pushNamed(context, Routes.register);},
                    child: const Text(
                      'Ainda não tem conta? Cadastre-se',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
