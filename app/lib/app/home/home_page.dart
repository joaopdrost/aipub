import 'package:app/repository/ticket_repository.dart';
import 'package:app/shared/routes.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/cart_store.dart';
import 'package:app/store/category_store.dart';
import 'package:app/store/product_store.dart';
import 'package:app/store/user_store.dart';
import 'package:app/widgets/adverts_widgwt.dart';
import 'package:app/widgets/back_button.dart';
import 'package:app/widgets/button_widget.dart';
import 'package:app/widgets/category_widget.dart';
import 'package:app/widgets/textos_widget.dart';
import 'package:app/widgets/tickets_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  setPageIndex(page) {
    setState(() {
      _pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);
    final CategoryStore category = Provider.of<CategoryStore>(context);
    final CartRepository cart = Provider.of<CartRepository>(context);
    final ProductStore product = Provider.of<ProductStore>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop()
                  ?
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const BackButtonCustom(color: Colors.transparent,))
                  : 
                  null,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextCustom(
              text: 'Bem vindo ',
              sizeText: 20,
            ),
            TextCustom(
              text: userStore.username,
              sizeText: 20,
              bold: FontWeight.bold,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                category.getCategory().isEmpty == true 
                    ?
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(color: Styles.primary,))
                   :
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: GridView.count(
                    childAspectRatio: 0.55,
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2,
                    children: List.generate(category.getCategory().length, (i) {
                      return CategoryWidget(
                          nameCategory: category.getCategory()[i].name,
                          urlImage:
                              'https://mccarthyspub.com.co/wp-content/uploads/2020/08/mccarthys-burger.png');
                    }),
                  ),
                ).animate().fade(delay: 200.ms),

                    product.getproduct().isEmpty == true 
                    ?
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(color: Styles.primary,))
                    :
                Stack(children: [
                  SizedBox(
                    width: double.infinity,
                    height: 230,
                    child: 
                     PageView(
                      controller: _pageController,
                      onPageChanged: setPageIndex,
                      children: [
                        AdvertsWidget(
                          product: product.getproduct()[3],
                        ),
                        AdvertsWidget(
                          product: product.getproduct()[1],
                        ),
                        AdvertsWidget(
                          product: product.getproduct()[0],
                        ),
                        AdvertsWidget(
                          product: product.getproduct()[4],
                        ),
                        AdvertsWidget(
                          product: product.getproduct()[2],
                        ),
                      ],
                    ),
                  ).animate().fade(delay: 200.ms),
                  Positioned(
                    bottom: -20,
                    left: 40,
                    child: SizedBox(
                      width: 300,
                      child: BottomNavigationBar(
                          selectedFontSize: 0,
                          type: BottomNavigationBarType.fixed,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          iconSize: 50,
                          selectedItemColor: Styles.primary,
                          unselectedItemColor: Styles.backgroud,
                          currentIndex: _pageIndex,
                          items: const [
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.remove,
                                ),
                                label: ''),
                            BottomNavigationBarItem(
                                icon: SizedBox(child: Icon(Icons.remove)), label: ''),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.remove), label: ''),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.remove), label: ''),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.remove), label: ''),
                          ]),
                    ),
                  ),
                ]),
                const SizedBox(height: 25,),
                const TextCustom(
                  text: 'Últimos Tickets',
                  sizeText: 24,
                ),
                tickets.isNotEmpty == true
                    ? Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          height: 230,
                          width: double.infinity,
                          child: GridView.count(
                            childAspectRatio: 1.7,
                            crossAxisCount: 2,
                            children: List.generate(
                                tickets.length > 3 ? 3 : tickets.length, (i) {
                              return TicketsWidget(
                                ticket: tickets.reversed.toList()[i],
                              );
                            }),
                          ),
                        ),
                        Positioned(
                            right: 60,
                            bottom: tickets.length < 2 ? 170 : 60,
                            child: GestureDetector(
                              onTap: () {
                                cart.setId(2);
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    Routes.home, (Route<dynamic> route) => false);
                              },
                              child: TextCustom(
                                text: 'Ver todos...',
                                sizeText: 16,
                                color: Styles.primary,
                                bold: FontWeight.bold,
                              ),
                            ))
                      ])
                    : Column(
                        children: [
                          const TextCustom(
                            text: 'Você ainda não possui tickets',
                            sizeText: 16,
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                              height: 50,
                              width: 200,
                              child: GestureDetector(
                                  onTap: () {
                                    cart.setId(1);
                                    Navigator.of(context).pushNamed(
                                      Routes.home,
                                    );
                                  },
                                  child: const ButtonWidget(
                                    text: 'Ver cardápio',
                                    sizeText: 20,
                                  ))),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
