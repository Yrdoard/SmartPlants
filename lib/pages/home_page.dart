import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:smartplants/widgets/stack_w.dart';
import 'package:smartplants/pages/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}
class _HomePage extends State<HomePage> {
  bool _isClicked = true  ;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/image/tanamanBg.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(200, 192, 204, 71),
            colorBlendMode: BlendMode.srcOver,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 45),
                    child: Text('Beranda',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Stack(
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
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 240,
                    margin: const EdgeInsets.only(top: 30, bottom: 60),
                    padding: const EdgeInsets.only(top: 15),
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
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Text('Kelembapan Terkini',style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(
                            height: 125,
                            width: 144,
                            child: SfRadialGauge(
                                axes: <RadialAxis>[
                                  RadialAxis(
                                      showTicks: false,
                                      pointers: const <GaugePointer>[
                                        RangePointer(
                                          enableAnimation: true,
                                          animationDuration: 3000,
                                          value: 0,
                                          width: 0.2,
                                          sizeUnit: GaugeSizeUnit.factor,
                                          gradient: SweepGradient(
                                              colors: <Color>[
                                                Color.fromARGB(255, 197, 153, 153),
                                                Color.fromARGB(255, 74, 18, 18)
                                              ],
                                              stops: <double>[0.25, 0.75]
                                          ),
                                        )
                                      ],
                                      showLabels: false,
                                      startAngle: 170,
                                      endAngle: 10,
                                      canScaleToFit: true,
                                      annotations: const <GaugeAnnotation>[
                                        GaugeAnnotation(
                                          axisValue: 50,
                                          positionFactor: 0.2,
                                          widget: Text('null'),
                                        )
                                      ],
                                      axisLineStyle: const AxisLineStyle(
                                          thickness: 0.2,
                                          thicknessUnit: GaugeSizeUnit.factor,
                                          color: Color.fromARGB(255, 233, 223, 223)
                                      )
                                  ),
                                ]
                            )
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 220,
                              height: 85,
                              padding: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(color: Theme.of(context).primaryColor, width: 1),
                                    top: BorderSide(color: Theme.of(context).primaryColor, width: 2)
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text('Kondisi',style: Theme.of(context).textTheme.headlineSmall,),
                                  const SizedBox(height: 5),
                                  const Text('null'),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 200,
                              height: 85,
                              padding: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: Theme.of(context).primaryColor, width: 1),
                                    top: BorderSide(color: Theme.of(context).primaryColor, width: 2)
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text('Status Menyiram',style: Theme.of(context).textTheme.headlineSmall,),
                                  const SizedBox(height: 5),
                                  const Text('null'),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Theme.of(context).primaryColor, width: 2)
                    ),
                    child: FloatingActionButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                height: 380,
                                width: 320,
                                padding: const EdgeInsets.only(top: 27),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 254, 244, 244),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Theme.of(context).primaryColor, width: 1)
                                ),
                                child: Column(
                                  children: [
                                    Text('Pilih Perangkat', style: Theme.of(context).textTheme.bodyLarge),
                                    SizedBox(
                                      width: 240,
                                      height: 60,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15)
                                              )
                                          ),
                                          backgroundColor: WidgetStateProperty.resolveWith<Color>(
                                                (Set<WidgetState> states) {
                                              if (states.contains(WidgetState.pressed)) _isClicked = !_isClicked;
                                              return _isClicked ? Colors.white : Theme.of(context).primaryColor;
                                            },
                                          ),
                                          foregroundColor: WidgetStateProperty.resolveWith<Color>(
                                                (Set<WidgetState> states) {
                                              if (states.contains(WidgetState.pressed)) _isClicked = !_isClicked;
                                              return _isClicked ? Theme.of(context).primaryColor : Colors.white;
                                            },
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isClicked = !_isClicked;
                                          });
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const NavBar()),
                                          );
                                        },
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('Perangkat 1',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                              ),),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.add,size: 36,),
                          Text('Pilih Perangkat',
                            style: TextStyle(color: Color.fromARGB(255, 103, 239, 108), fontSize: 11, fontWeight: FontWeight.w500,),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
