import 'package:go_router/go_router.dart';
import 'package:smartplants/pages/home_page.dart';
import 'package:smartplants/pages/jadwal.dart';

import '../pages/navbar.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const NavBar()
  ),
  GoRoute(
      path: '/Beranda',
    builder: (context, state) => const HomePages()
  ),
  GoRoute(
      path: '/Jadwal',
      builder: (context, state) => const JadwalPage()
  ),
  ]);
