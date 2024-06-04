import 'package:flutter/material.dart';
import 'package:portal/app/command_page.dart';
import 'package:portal/app/employees_page.dart';
import 'package:portal/app/home_page.dart';
import 'package:portal/app/products_page.dart';

import 'package:portal/shared/assets.dart';
import 'package:portal/shared/styles.dart';
import 'package:portal/widgets/global/default_button_widget.dart';

const labelStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const selectedColor = Colors.white;

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int index = 0;
  List<Widget> pages = [
    const HomePage(),
    const CommandPage(),
    const ProductPage(),
    const EmployeesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NavigationRail(
            minExtendedWidth: 210,
            extended: true,
            backgroundColor: Styles.accent,
            indicatorColor: Styles.primary,
            selectedIndex: index,
            labelType: NavigationRailLabelType.none,
            selectedLabelTextStyle: labelStyle.copyWith(color: selectedColor),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            leading: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    (Assets.logo),
                  ),
                ),
              ),
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.receipt),
                label: Text('Comandas'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart),
                label: Text('Produtos'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                label: Text('Funcionários'),
              ),
            ],
            trailing: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Styles.backgroud),
                    child: const SizedBox(
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    'Victor',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Styles.backgroud,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  DefaultButton(
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 20,
                              color: Styles.backgroud,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.logout_outlined,
                          color: Color(0xff933011),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 18))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(Assets.loginBackground),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color(0xff000000).withOpacity(0.7),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: pages[index],
            ),
          ),
        ],
      ),
    );
  }
}
