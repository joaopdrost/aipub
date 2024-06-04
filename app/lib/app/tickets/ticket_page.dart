import 'package:app/repository/ticket_repository.dart';
import 'package:app/shared/routes.dart';
import 'package:app/store/cart_store.dart';
import 'package:app/widgets/back_button.dart';
import 'package:app/widgets/button_widget.dart';
import 'package:app/widgets/textos_widget.dart';
import 'package:app/widgets/tickets_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    CartRepository cart = Provider.of<CartRepository>(context);
    return Scaffold(
        appBar: AppBar(
          leading: Navigator.of(context).canPop()
                  ?
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const BackButtonCustom(color: Colors.transparent,))
                  : 
                  null,
          title: const TextCustom(text: 'Meus tickets',sizeText: 32,),
          centerTitle: true,
        ),
        body: tickets.isNotEmpty == true
            ? GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.8,
                children: List.generate(tickets.length,
                    (index) => TicketsWidget(ticket: tickets[index])),
              )
            : Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextCustom(text: 'Você ainda não possui tickets.'),
                    SizedBox(
                        height: 45,
                        child: GestureDetector(
                          onTap: () {
                            cart.setId(1);
                            Navigator.of(context).pushNamed(Routes.home,
                                arguments: {'idPage': 1});
                          },
                          child: const ButtonWidget(
                            text: 'Ver cardápio',
                            sizeText: 24,
                          ),
                        ))
                  ],
                ),
              ));
  }
}
