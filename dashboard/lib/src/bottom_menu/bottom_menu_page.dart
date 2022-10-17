import 'package:dashboard/src/bottom_menu/bottom_menu_controller.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

class BottomMenuPage extends StatefulWidget {
  final BottomMenuController controller;

  const BottomMenuPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<BottomMenuPage> createState() => _BottomMenuPageState();
}

class _BottomMenuPageState extends State<BottomMenuPage> {
  @override
  void initState() {
    super.initState();
    Modular.to.addListener(onChangeRoute);
  }

  void onChangeRoute() {
    if (Modular.to.path.contains('inicio')) {
      widget.controller.selectItem = 0;
    }
    if (Modular.to.path.contains('novidades')) {
      widget.controller.selectItem = 1;
    }
    if (Modular.to.path.contains('divulgar')) {
      widget.controller.selectItem = 2;
    }
    if (Modular.to.path.contains('pedidos')) {
      widget.controller.selectItem = 3;
    }
    if (Modular.to.path.contains('menu')) {
      widget.controller.selectItem = 4;
    }
    setState(() {});
  }

  @override
  void dispose() {
    Modular.to.removeListener(onChangeRoute);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.controller.selectItem,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black38,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        onTap: (index) {
          setState(() {
            widget.controller.selectItem = index;
          });
          switch (index) {
            case 0:
              Modular.to.navigate('/dashboard/inicio');
              break;
            case 1:
              Modular.to.navigate('/dashboard/novidades/');
              break;
            case 2:
              Modular.to.navigate('/dashboard/divulgar/');
              break;
            case 3:
              Modular.to.navigate('/dashboard/pedidos/');
              break;
            case 4:
              Modular.to.navigate('/dashboard/menu/');
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'INÍCIO',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases_outlined),
            label: 'NOVIDADES',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'DIVULGAR',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard),
            label: 'PEDIDOS',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'MENU',
            backgroundColor: Colors.grey,
          ),
        ],
        // onTap: _onItemTapped,
      ),
    );
  }
}
