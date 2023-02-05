import 'package:flutter/material.dart';

import 'home/homescreen.dart';

class DashboardHomeScreen extends StatefulWidget {
  const DashboardHomeScreen({super.key});

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
  int selectedIndex = 0;
  final widgetOptions = [
    HomeScreen(),
    const Text('Stores'),
    const Text('My Plans'),
    const Text('Gift Cards'),
    const Text('Redeem'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Stores'),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_sharp), label: 'My Plans'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Gift Cards'),
          BottomNavigationBarItem(icon: Icon(Icons.get_app), label: 'Redeem'),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepOrange,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
