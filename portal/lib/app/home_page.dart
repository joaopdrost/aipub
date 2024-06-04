import 'package:flutter/material.dart';

import 'package:portal/shared/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 0.75,
            child: Container(
              margin: const EdgeInsets.only(
                top: 40,
              ),
              decoration: const BoxDecoration(
                color: Color(0xffD9D9D9),
                shape: BoxShape.rectangle,
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: [
                      Text(
                        'Vendas do Dia',
                        style: TextStyle(
                          fontSize: 15,
                          color: Styles.text,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 9),
                        child: Icon(
                          Icons.info_sharp,
                          size: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Números de pedidos',
                              style: TextStyle(color: Color(0xffa3a7a9))),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('2'),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text('Valor total',
                              style: TextStyle(color: Color(0xffa3a7a9))),
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('R\$ 15,00'))
                        ],
                      ),
                      Column(
                        children: [
                          Text('Ticket médio',
                              style: TextStyle(color: Color(0xffa3a7a9))),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('R\$ 7,50'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
              height: 330,
              width: 430,
              child: Container(
                margin: const EdgeInsets.only(left: 40, top: 30),
                decoration: const BoxDecoration(
                  color: Color(0xffD9D9D9),
                  shape: BoxShape.rectangle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$ Vendas',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Total de vendas',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffa3a7a9))),
                            SizedBox(
                              height: 2,
                            ),
                            Text('500'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Novos Clientes',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffa3a7a9))),
                            SizedBox(
                              height: 2,
                            ),
                            Text('50'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Valor Total',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffa3a7a9))),
                            SizedBox(
                              height: 2,
                            ),
                            Text('R\$ 1000,00'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Ticket Médio',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffa3a7a9))),
                            SizedBox(
                              height: 2,
                            ),
                            Text('R\$ 20,00'),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 330,
              width: 430,
              child: Container(
                margin: const EdgeInsets.only(right: 40, top: 30),
                decoration: const BoxDecoration(
                  color: Color(0xffD9D9D9),
                  shape: BoxShape.rectangle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.store),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text('Operação'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total de Cancelamentos',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xffa3a7a9))),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('10'),
                                SizedBox(
                                  height: 15,
                                ),
                                Text('Tempo aberto',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xffa3a7a9))),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('24 horas'),
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
              height: 160,
              width: 430,
              child: Container(
                margin: const EdgeInsets.only(left: 40, top: 50),
                decoration: const BoxDecoration(
                  color: Color(0xffD9D9D9),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            SizedBox(
              height: 160,
              width: 430,
              child: Container(
                margin: const EdgeInsets.only(right: 40, top: 50),
                decoration: const BoxDecoration(
                  color: Color(0xffD9D9D9),
                  shape: BoxShape.rectangle,
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
