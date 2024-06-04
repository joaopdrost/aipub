import 'package:app/model/ticket_model.dart';
import 'package:app/shared/styles.dart';
import 'package:app/widgets/button_widget.dart';
import 'package:app/widgets/textos_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class TicketsWidget extends StatelessWidget {
  const TicketsWidget({super.key, required this.ticket});
  final Tickets ticket;

  dynamic _qrcode(context, ticket) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => SimpleDialog(
      title: Text(ticket.name),
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: PrettyQrView(
                qrImage: QrImage(QrCode(
              8,
              QrErrorCorrectLevel.H,
            )..addData(ticket!.id))),
          ),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 90,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Styles.accent,
          borderRadius: BorderRadius.all(Radius.circular(Styles.borderB))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: SizedBox(
              height: 100,
              width: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft:Radius.circular(Styles.borderB),
                  topLeft: Radius.circular(Styles.borderB)),
                child: Image.network(
                  ticket.urlImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0,top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                       Text(
                                ticket.name,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inika(
                                  textStyle: 
                                   TextStyle(
                                    fontSize: 16,
                                    color: Styles.backgroud,
                                    fontWeight: FontWeight.normal),
                                )
                              ),

                  // TextCustom(
                  //   text: ticket.name,
                  //   maxLines: 1,
                  //   color: Styles.backgroud,
                  //   overflow: TextOverflow.ellipsis,
                  //   font: 'Inika',
                  //   sizeText: 16,
                  // ),


                      Text('${ticket.qtd} tickets',
                      style: TextStyle(
                        fontSize: 10,
                        color: Styles.backgroud),),
                   GestureDetector(
                    onTap: () => _qrcode(context,ticket),
                    child: const SizedBox(
                      height: 35,
                      child: ButtonWidget(text: 'Usar agora'),
                      ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


