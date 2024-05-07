import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:smartplants/widgets/stack_w.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePageState();
}
double v = 20 ;
class _HomePageState extends State<HomePages> {
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
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text('Beranda',
                    style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                const BstackW(),
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 160,
                  margin: const EdgeInsets.only(top: 54),
                  padding: const EdgeInsets.only(top: 20),
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
                      Text('Waktu Penyiraman',style: Theme.of(context).textTheme.headline2),
                           SizedBox(
                               height: 125,
                               width: 144,
                               child: SfRadialGauge(
                                   axes: <RadialAxis>[RadialAxis(
                                       showTicks: false,
                                       pointers: <GaugePointer>[
                                         RangePointer(
                                           value: v,
                                           width: 0.2,
                                           sizeUnit: GaugeSizeUnit.factor,
                                           gradient: const SweepGradient(
                                               colors: <Color>[
                                                 Color.fromARGB(255, 197, 153, 153),
                                                 Color.fromARGB(255, 74, 18, 18)
                                               ],
                                               stops: <double>[0.25, 0.75]),)
                                       ],
                                       showLabels: false,
                                       startAngle: 170,
                                       endAngle: 10,
                                       canScaleToFit: true,
                                       annotations: <GaugeAnnotation>[
                                         GaugeAnnotation(
                                             axisValue: 50,
                                             positionFactor: 0.2,
                                             widget: Text(
                                               v.round().toString() + ("%"),
                                                 style: Theme.of(context).textTheme.bodyText1))
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
                         ],
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           width: MediaQuery.of(context).size.width - 240,
                           height: 60,
                           margin: const EdgeInsets.only(top: 40, bottom: 68),
                           padding: const EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               color: Theme.of(context).primaryColor,
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
                           child: Column(
                             children: [
                               Text('Kondisi',style: Theme.of(context).textTheme.headline3,),
                               const SizedBox(height: 5),
                               Text('Normal',style: Theme.of(context).textTheme.bodyText2,),
                             ],
                           ),
                         ),
                         Container(
                           width: MediaQuery.of(context).size.width - 210,
                           height: 60,
                           margin: const EdgeInsets.only(left: 10, top: 40, bottom: 68),
                           padding: const EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               color: Theme.of(context).primaryColor,
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
                           child: Column(
                             children: [
                               Text('Status',style: Theme.of(context).textTheme.headline3,),
                               const SizedBox(height: 5),
                               Text('Tidak Menyiram',style: Theme.of(context).textTheme.bodyText2,),
                             ],
                           ),
                         )
                       ],
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

                           },
                           child: Column(
                             children: [
                               const Icon(Icons.add,size: 36,),
                               Text('Pilih Perangkat',style: Theme.of(context).textTheme.headline2,)
                             ],
                           ),
                         ),
                     ),
                   ],
                 ),
               ),
           ],
         ),

    );
  }
  }
