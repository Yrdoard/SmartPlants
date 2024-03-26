import 'package:flutter/material.dart';
import 'package:smartplants/app/routes.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      routerConfig: routes,
      
      debugShowCheckedModeBanner: false,
    );
  }

}