import 'package:dashboard/src/inicio/inicio_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  final InicioController controller;

  const InicioPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  var _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  // void _onItemTapped(int index) {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Início'), automaticallyImplyLeading: false),
      body: Column(
        children: [
          AppButton(
            label: 'get Cats Facts',
            onPressed: () => widget.controller.getCatFact(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.green.shade900,
        unselectedItemColor: Colors.black38,

        selectedFontSize: 9,
        unselectedFontSize: 9,

        onTap: (index) {
          widget.controller.goModule(index);
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
