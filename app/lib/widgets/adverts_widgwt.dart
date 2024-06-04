import 'package:app/model/product_model.dart';
import 'package:app/shared/routes.dart';
import 'package:app/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvertsWidget extends StatelessWidget {
  const AdvertsWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.details, arguments: {'product': product}),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
       
        child: Container(
          margin: const EdgeInsets.only(right: 4,left: 4),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 35.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Styles.borderL),
                  child: Image.network(
                    'https://www.solofondos.com/wp-content/uploads/2016/11/fondo-rojo-hd.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                  top: -1,
                  right: -10,
                  child: SizedBox(
                    height: 185,
                    width: 185,
                    child: 
                      ClipOval(
                        child: Image.network(
                          product.urlImage)
                            .animate()
                            .fade(duration: 800.ms)
                            .moveX(begin: 180, end: 20, curve: Curves.easeInOut)
                            .rotate(end: 0.03)
                            .scale(),
                        ),
                        )
                        .animate(
                        onPlay: (controller) => controller.repeat())
                        .shake(delay: 4.seconds, hz: 1.67, duration: 2.seconds)),
              Positioned(
                top: 30,
                left: 20,
                child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color.fromARGB(97, 48, 48, 48),
                          blurRadius: 30,
                          offset: Offset(
                            1.1,
                            1.1,
                          ),
                        )
                      ],
                    ),
                    child: SizedBox(
                      width: 200,
                      child: 
                       Text(
                          product.name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.deliciousHandrawn(
                            textStyle: 
                            TextStyle(
                              fontSize: 42,
                              color:Styles.primary,
                              fontWeight: FontWeight.normal),
                          )
                        )
                        .animate(
                        onPlay: (controller) => controller.repeat() )
                        .shimmer(delay: 3.seconds, duration: 1.seconds, colors: [
                          const Color.fromARGB(255, 255, 237, 72),
                          Colors.white,
                          const Color.fromARGB(255, 255, 237, 72)
                        ])
                      .rotate(end: -0.02, begin: -0.01).then().rotate(begin: -0.02, end: -0.01),
                    )).animate().fade(delay: 800.ms, duration: 400.ms)
              ),
              Positioned(
                bottom: 12,
                right: 40,
                child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color.fromARGB(95, 0, 0, 0),
                              blurRadius: 15,
                              offset: Offset(
                                1.1,
                                1.1,
                              ),
                            )
                          ],
                        ),
                        child: 
                            Text(
                                'R\$ ${product.price.toStringAsFixed(2)}',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.luckiestGuy(
                                  textStyle: 
                                  const TextStyle(
                                    fontSize: 36,
                                    color:Color.fromARGB(255, 255, 237, 72),
                                    fontWeight: FontWeight.normal),
                                )
                              )
                            .animate(
                              onPlay: (controller) => controller.repeat())
                            .scaleXY(
                                duration: 400.ms,
                                delay: 3.seconds,
                                begin: 0.9,
                                end: 1.2)
                            .then()
                            .scaleXY(
                                duration: 400.ms,
                                delay: 0.seconds,
                                begin: 1.2,
                                end: 0.9) )
                            .animate()
                            .fade(delay: 1200.ms, duration: 400.ms),
              ),
              Positioned(
                  top: 95,
                  left: 15,
                  child: SizedBox(
                    width: 190,
                    height: 110,
                    child: Text(
                      textAlign: TextAlign.center,
                      product.description,
                      style: const TextStyle(
                          overflow: TextOverflow.fade, color: Colors.white),
                    ).animate().fade(delay: 300.ms),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
