import 'package:flutter/material.dart';
import 'package:smartplants/pages/beranda.dart';
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
        const Beranda(),
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
        destinations: const[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_outlined,color: Color.fromARGB(255, 0, 111, 18)),
            icon: Icon(Icons.home_outlined,color: Colors.grey),
            label: 'Beranda',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.date_range_outlined,color: Color.fromARGB(255, 0, 111, 18)),
            icon: Icon(Icons.date_range_outlined,color: Colors.grey),
            label:'Jadwal',
          ),
        ],
      ),
    );

  }
}