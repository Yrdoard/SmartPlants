import 'package:flutter/material.dart';

class JstackW extends StatelessWidget {
  const JstackW({super.key});


  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 52.5, top: 175),
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
      top: 217,
      left: 87,

        child:  SizedBox(
          width: 50,
          child: Image.asset(
            "assets/image/Ellipse2.png",),
        )
    )



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
            margin: const EdgeInsets.only(left: 45, top: 110),
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
            child: SizedBox(
              width: 250,
              child: Image.asset(
                "assets/image/tanamanB.png",),
            ),
          ),


          Positioned(
              top: 152,
              left: 58,
              child:  SizedBox(
                width: 33,
                child: Image.asset(
                  "assets/image/Ellipse2.png",),
              )
          ),
          Positioned(
              top: 158,
              left: 98,

              child:  SizedBox(
                width: 37,
                child: Image.asset(
                  "assets/image/Ellipse2.png",),
              )
          ),
          Positioned(
              top: 152,
              left: 143,

              child:  SizedBox(
                width: 25,
                child: Image.asset(
                  "assets/image/Ellipse2.png",),
              )
          )

        ]
    );

  }

}
class Background extends StatelessWidget {
  const Background({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            child: SizedBox(
              child: Image.asset(
                "assets/image/tanamanBg.png",),
            ),
          ),

        ]
    );
  }
}
