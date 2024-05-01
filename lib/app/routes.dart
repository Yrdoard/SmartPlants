import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartplants/pages/atur_jadwal.dart';
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
  GoRoute(
      path: '/AJadwal',
      builder: (context, state) => const NumberPage()
  )
]);
