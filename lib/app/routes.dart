import 'package:go_router/go_router.dart';

import 'package:smartplants/pages/home_pages.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePages(),
  )
]);
