import 'package:flutter/material.dart';

class JstackW extends StatelessWidget {
  const JstackW({super.key});


  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 50, top: 175),
          width: MediaQuery.of(context).size.width - 240,
          height: 60,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0,3),
                ),
              ],
              borderRadius: BorderRadius.circular(15)
          ),
        ),
        Positioned(
          child: SizedBox(
            height: 240,
            child: Image.asset(
              "assets/image/tanamanJ.png",),
          ),
        ),
        Positioned(
          top: 205,
          left: 15,
          child: SizedBox(
            height: 40,
            child: Image.asset(
              "assets/image/Ellipse2.png",),
          ),
        ),
      ]
    );
  }
}
class BstackW extends StatelessWidget {
  const BstackW({super.key});


  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 90),
          width: MediaQuery.of(context).size.width - 200,
          height: 60,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0,3),
                ),
              ],
              borderRadius: BorderRadius.circular(15)
          ),
        ),
        Positioned(
            top: 120,
            left: 25,
            child:  SizedBox(
              width: 110,
              child: Image.asset(
                "assets/image/Ellipse2.png",),
            )
        ),
        Positioned(
          left: 5,
          child: SizedBox(
            width: 150,
            child: Image.asset(
              "assets/image/tanaman.png",),
          ),
        ),
      ]
    );
  }
}
