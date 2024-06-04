import 'package:app/app/home/home_page.dart';
import 'package:app/app/menu/menu_page.dart';
import 'package:app/app/profile/profile_page.dart';
import 'package:app/app/tickets/ticket_page.dart';
import 'package:app/shared/routes.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/cart_store.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  int pageIndex = 0;
  late PageController pc;
  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: pageIndex);
  }

  setPageIndex(page) {
    setState(() {
      pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CartRepository cart = Provider.of<CartRepository>(context);
    pageIndex = cart.idpage();
    pc = PageController(initialPage: pageIndex);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: pc,
        onPageChanged: (page) {
          cart.setId(page);
          setPageIndex(page);
        },
        children: const [
          HomePage(),
          MenuPage(),
          TicketPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 8,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          backgroundColor: Styles.secondary,
          selectedItemColor: Styles.primary,
          unselectedItemColor: Styles.backgroud,
          currentIndex: pageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicío'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Cardápio'),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Tickets'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined), label: 'Perfil'),
          ],
          onTap: (page) {
            pc.animateToPage(page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          }),
      floatingActionButton: Stack(children: [
        SizedBox(
          height: 60,
          width: 60,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color.fromARGB(150, 0, 0, 0),
                  blurRadius: 40,
                  offset: Offset(
                    1.1,
                    1.1,
                  ),
                )
              ],
            ),
            child: CircleAvatar(
              // foregroundColor: Styles.primary,
              backgroundColor: Styles.primary,
              child: SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Styles.primary,
                  foregroundColor: Styles.backgroud,
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.cart);
                  },
                  child: const Icon(
                    Icons.shopping_basket_outlined,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ),
        cart.cart.isNotEmpty == true
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 212, 212, 212),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      cart.cart.length.toString(),
                      style: TextStyle(color: Styles.primary),
                    )))
            : Text('')
      ]),
    );
  }
}
