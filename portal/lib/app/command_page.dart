import 'package:flutter/material.dart';

class CommandPage extends StatelessWidget {
  const CommandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FractionallySizedBox(
      widthFactor: 0.90,
      child: Container(
        color: const Color(0xffD9D9D9),
        child: DataTable(columns: const <DataColumn>[
          DataColumn(
              label: Expanded(
                  child: Text(
            "Comandas",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ))),
          DataColumn(
              label: Expanded(
                  child: Text(
            "",
          ))),
          DataColumn(
              label: Expanded(
                  child: Text(
            " ",
          ))),
          DataColumn(
              label: Expanded(
                  child: Text(
            " ",
          ))),
        ], rows: <DataRow>[
          const DataRow(
            cells: <DataCell>[
              DataCell(Text('Horário')),
              DataCell(Text('Pedido')),
              DataCell(Text('Situação')),
              DataCell(Text('Total')),
            ],
          ),
          DataRow(cells: const <DataCell>[
            DataCell(Text('Hoje')),
            DataCell(Text('1')),
            DataCell(Text('R\$ 9,99')),
            DataCell(Text('')),
          ], color: MaterialStateProperty.all(Colors.grey.withOpacity(0.2))),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('23:23')),
              const DataCell(Text('1')),
              DataCell(Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                  ),
                  child: const Text('Em andamento',style: TextStyle(color: Colors.orange),))),
              const DataCell(Text('R\$ 9,99')),
            ],
          ),
          DataRow(cells: const <DataCell>[
            DataCell(Text('03/06/24')),
            DataCell(Text('2')),
            DataCell(Text('R\$ 10,40')),
            DataCell(Text('')),
          ], color: MaterialStateProperty.all(Colors.grey.withOpacity(0.2))),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('15:23')),
              const DataCell(Text('2')),
              DataCell(Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                  ),
                  child:  const Text('Em concluido',style: TextStyle(color: Colors.green),))),
              const DataCell(Text('R\$ 20,80')),
            ],
          ),
        ]),
      ),
    ));
  }
}
