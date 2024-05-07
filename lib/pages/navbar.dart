import 'package:flutter/material.dart';

import 'package:smartplants/pages/home_page.dart';
import 'package:smartplants/pages/jadwal.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: [
          const HomePages(),
          const JadwalPage(),
        ][selectedIndex],
        bottomNavigationBar: NavigationBar(
          height: 60,
          elevation: 20,
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(Icons.home,color: Theme.of(context).primaryColor),
              icon: const Icon(Icons.home_outlined,color: Colors.grey),
              label: 'Beranda',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.date_range,color: Theme.of(context).primaryColor),
              icon: const Icon(Icons.date_range_outlined,color: Colors.grey),
              label:'Jadwal',
            ),
          ],
        ),
      );

  }
}