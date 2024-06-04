// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Funcionario {
  String nome;
  String sobrenome;
  String matricula;
  String email;
  String cargo;

  Funcionario({
    required this.nome,
    required this.sobrenome,
    required this.matricula,
    required this.email,
    required this.cargo,
  });
}

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 1200,
          height: 700,
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Funcionários",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: EmployeesContent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeesContent extends StatefulWidget {
  const EmployeesContent({super.key});

  @override
  _EmployeesContentState createState() => _EmployeesContentState();
}

class _EmployeesContentState extends State<EmployeesContent> {
  List<Funcionario> listaFuncionarios = [];

  void _abrirFormularioCadastro(
      {Funcionario? funcionario, bool isEditing = false}) {
    final nomeController =
        TextEditingController(text: isEditing ? funcionario!.nome : '');
    final sobrenomeController =
        TextEditingController(text: isEditing ? funcionario!.sobrenome : '');
    final matriculaController =
        TextEditingController(text: isEditing ? funcionario!.matricula : '');
    final emailController =
        TextEditingController(text: isEditing ? funcionario!.email : '');
    final cargoController =
        TextEditingController(text: isEditing ? funcionario!.cargo : '');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              isEditing ? 'Editar Funcionário' : 'Adicionar Novo Funcionário'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Nome')),
                TextField(
                    controller: sobrenomeController,
                    decoration: const InputDecoration(labelText: 'Sobrenome')),
                TextField(
                    controller: matriculaController,
                    decoration: const InputDecoration(labelText: 'Matrícula')),
                TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email')),
                TextField(
                    controller: cargoController,
                    decoration: const InputDecoration(labelText: 'Cargo')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(isEditing ? 'Salvar' : 'Adicionar'),
              onPressed: () {
                if (isEditing) {
                  setState(() {
                    funcionario!.nome = nomeController.text;
                    funcionario.sobrenome = sobrenomeController.text;
                    funcionario.matricula = matriculaController.text;
                    funcionario.email = emailController.text;
                    funcionario.cargo = cargoController.text;
                  });
                } else {
                  setState(() {
                    listaFuncionarios.add(Funcionario(
                      nome: nomeController.text,
                      sobrenome: sobrenomeController.text,
                      matricula: matriculaController.text,
                      email: emailController.text,
                      cargo: cargoController.text,
                    ));
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: listaFuncionarios.length,
            itemBuilder: (context, index) {
              final funcionario = listaFuncionarios[index];
              return ListTile(
                title: Text('${funcionario.nome} ${funcionario.sobrenome}'),
                subtitle: Text(
                    'Matrícula: ${funcionario.matricula} - Cargo: ${funcionario.cargo}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _abrirFormularioCadastro(
                          funcionario: funcionario, isEditing: true),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _excluirFuncionario(index),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () => _abrirFormularioCadastro(isEditing: false),
            child: const Text('Adicionar Novo Funcionário'),
          ),
        ),
      ],
    );
  }

  void _excluirFuncionario(int index) {
    setState(() {
      listaFuncionarios.removeAt(index);
    });
  }
}
