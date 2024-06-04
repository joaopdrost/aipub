// ignore_for_file: library_private_types_in_public_api, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class Produto {
  String nome;
  String descricao;
  String receita;
  int estoque;
  double precoVenda;
  double precoCusto;
  Categoria categoria;

  Produto({
    required this.nome,
    required this.descricao,
    required this.receita,
    required this.estoque,
    required this.precoVenda,
    required this.precoCusto,
    required this.categoria,
  });
}

class Categoria {
  String nome;
  String descricao;

  Categoria({required this.nome, this.descricao = ''});
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 1200,
          height: 800,
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Produtos",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: ProductContent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductContent extends StatefulWidget {
  const ProductContent({super.key});

  @override
  _ProductContentState createState() => _ProductContentState();
}

class _ProductContentState extends State<ProductContent> {
  List<Produto> listaProdutos = [];
  List<Categoria> listaCategorias = [Categoria(nome: 'Geral')];
  Categoria? selectedFilter;

  void _abrirFormularioProduto({Produto? produto, bool isEditing = false}) {
    final nomeController =
        TextEditingController(text: isEditing ? produto?.nome : '');
    final descricaoController =
        TextEditingController(text: isEditing ? produto?.descricao : '');
    final receitaController =
        TextEditingController(text: isEditing ? produto?.receita : '');
    final estoqueController = TextEditingController(
        text: isEditing ? produto?.estoque.toString() : '');
    final precoVendaController = TextEditingController(
        text: isEditing ? produto?.precoVenda.toString() : '');
    final precoCustoController = TextEditingController(
        text: isEditing ? produto?.precoCusto.toString() : '');
    // Garante que o produto tenha uma categoria válida ou usa a primeira da lista se estiver editando, ou 'null' se adicionando novo
    Categoria? selectedCategoria = isEditing
        ? produto?.categoria
        : (listaCategorias.isNotEmpty ? listaCategorias.first : null);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isEditing ? 'Editar Produto' : 'Adicionar Novo Produto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Nome')),
                TextField(
                    controller: descricaoController,
                    decoration: const InputDecoration(labelText: 'Descrição')),
                TextField(
                    controller: receitaController,
                    decoration: const InputDecoration(labelText: 'Receita')),
                TextField(
                    controller: estoqueController,
                    decoration: const InputDecoration(labelText: 'Estoque')),
                TextField(
                    controller: precoVendaController,
                    decoration:
                        const InputDecoration(labelText: 'Preço de Venda')),
                TextField(
                    controller: precoCustoController,
                    decoration:
                        const InputDecoration(labelText: 'Preço de Custo')),
                DropdownButton<Categoria>(
                  value: selectedCategoria,
                  isExpanded: true,
                  onChanged: (Categoria? newValue) {
                    setState(() {
                      selectedCategoria = newValue;
                    });
                  },
                  items: listaCategorias
                      .map<DropdownMenuItem<Categoria>>((Categoria value) {
                    return DropdownMenuItem<Categoria>(
                      value: value,
                      child: Text(value.nome),
                    );
                  }).toList(),
                ),
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
                if (isEditing && produto != null) {
                  setState(() {
                    produto.nome = nomeController.text;
                    produto.descricao = descricaoController.text;
                    produto.receita = receitaController.text;
                    produto.estoque = int.tryParse(estoqueController.text) ?? 0;
                    produto.precoVenda =
                        double.tryParse(precoVendaController.text) ?? 0.0;
                    produto.precoCusto =
                        double.tryParse(precoCustoController.text) ?? 0.0;
                    produto.categoria = selectedCategoria!;
                  });
                } else {
                  setState(() {
                    listaProdutos.add(Produto(
                      nome: nomeController.text,
                      descricao: descricaoController.text,
                      receita: descricaoController.text,
                      estoque: int.tryParse(estoqueController.text) ?? 0,
                      precoVenda:
                          double.tryParse(precoVendaController.text) ?? 0.0,
                      precoCusto:
                          double.tryParse(precoCustoController.text) ?? 0.0,
                      categoria: selectedCategoria!,
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

  void _adicionarCategoria() {
    final nomeCategoriaController = TextEditingController();
    final descricaoCategoriaController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Nova Categoria'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeCategoriaController,
                decoration:
                    const InputDecoration(labelText: 'Nome da Categoria'),
              ),
              TextField(
                controller: descricaoCategoriaController,
                decoration:
                    const InputDecoration(labelText: 'Descrição da Categoria'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Adicionar'),
              onPressed: () {
                if (nomeCategoriaController.text.isNotEmpty) {
                  setState(() {
                    listaCategorias.add(Categoria(
                      nome: nomeCategoriaController.text,
                      descricao: descricaoCategoriaController.text,
                    ));
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Produto> filteredProdutos = selectedFilter == null ||
            selectedFilter!.nome == 'Geral'
        ? listaProdutos
        : listaProdutos.where((p) => p.categoria == selectedFilter).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _adicionarCategoria,
                child: const Text('Adicionar Categoria'),
              ),
              DropdownButton<Categoria>(
                hint: const Text("Filtrar por categoria"),
                value: selectedFilter,
                onChanged: (Categoria? newValue) {
                  setState(() {
                    selectedFilter = newValue;
                  });
                },
                items: listaCategorias
                    .map<DropdownMenuItem<Categoria>>((Categoria value) {
                  return DropdownMenuItem<Categoria>(
                    value: value,
                    child: Text(value.nome),
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () => _abrirFormularioProduto(isEditing: false),
                child: const Text('Adicionar Novo Produto'),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Item')),
                DataColumn(label: Text('Categoria')),
                DataColumn(label: Text('Preço de Custo')),
                DataColumn(label: Text('Preço de Venda')),
                DataColumn(label: Text('Estoque')),
                DataColumn(label: Text('Ações')),
              ],
              rows: filteredProdutos
                  .map((produto) => DataRow(
                        cells: [
                          DataCell(Text(produto.nome)),
                          DataCell(Text(produto.categoria.nome)),
                          DataCell(
                              Text('${produto.precoCusto.toStringAsFixed(2)}')),
                          DataCell(
                              Text('${produto.precoVenda.toStringAsFixed(2)}')),
                          DataCell(Text(produto.estoque.toString())),
                          DataCell(Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _abrirFormularioProduto(
                                    produto: produto, isEditing: true),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    listaProdutos.remove(produto);
                                  });
                                },
                              ),
                            ],
                          )),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
