import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:portal/shared/assets.dart';
import 'package:portal/shared/styles.dart';
import 'package:portal/widgets/global/default_text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio();

  Future<dynamic> login(String username, String password) async {
    try {
      Response response = await _dio.post(
       "https://aipub-backend-git-test-victorgrodriguesm7s-projects.vercel.app/api/token/",
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Email ou senha inválidos');
      }
    } on DioError catch (e) {
      if (e.response != null && e.response?.statusCode != 200) {
        throw Exception('Email ou senha inválidos');
      } else {
        throw Exception('Erro na requisição: ${e.message}');
      }
    }
  }
}

class _LoginPageState extends State<LoginPage> {
  final ApiClient _apiClient = ApiClient();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              Assets.loginBackground,
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color(0xff000000).withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: CircleAvatar(
                    radius: 140,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(Assets.logo),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Text(
                    'Portal Administrativo',
                    style: TextStyle(
                      color: Color(0xffF2802F),
                      fontSize: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    'Gerencie seu estabelecimento de forma simples e rápida',
                    style: TextStyle(
                      color: Styles.primary,
                      fontSize: 20,
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.29,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: DefaultTextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Matrícula',
                          controller: _usernameController,
                        ),
                      ),
                      DefaultTextFormField(
                        keyboardType: TextInputType.number,
                        hintText: 'Senha',
                        controller: _passwordController,
                         obscureText: true
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 10),
                  child: FractionallySizedBox(
                    widthFactor: 0.29,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final email = _usernameController.text;
                          final password = _passwordController.text;
                          final response = await _apiClient.login(email, password);
                          if (response != null) {
                            
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        } catch (e) {
                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Styles.accent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 25,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Styles.borderB),
                        ),
                      ),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}