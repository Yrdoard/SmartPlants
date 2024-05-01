import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartplants/widgets/stack_w.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:go_router/go_router.dart';


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
            color: Color.fromARGB(127, 173, 189, 14),
            colorBlendMode: BlendMode.srcOver,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,),
          SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,),
                  child: Text('Beranda',
                    style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                const BstackW(),
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 160,
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.only(top: 5),
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
                      Text('Waktu Penyiraman',style: Theme.of(context).textTheme.headline2,),
                           SizedBox(
                               height: 139,
                               width: double.infinity,
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
                                                 Color.fromARGB(180, 119, 53, 18),
                                                 Color.fromARGB(255, 119, 53, 18)
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
                                               style:
                                               const TextStyle(
                                                 fontWeight: FontWeight.w700,
                                                 fontSize: 15,),))
                                       ],
                                       axisLineStyle: const AxisLineStyle(
                                           thickness: 0.2,
                                           thicknessUnit: GaugeSizeUnit.factor,
                                           color: Color.fromARGB(255, 254, 225, 225)
                                       )
                                   ),
                                   ]
                               )
                           ),
                         ],
                       ),
                     ),
                     Row(
                       children: [
                         Container(
                           width: MediaQuery.of(context).size.width - 239,
                           height: 60,
                           margin: const EdgeInsets.only(left: 40, top: 40, bottom: 84),
                           padding: const EdgeInsets.all(5),
                           child: Column(
                             children: [
                               Text('Kondisi',style: Theme.of(context).textTheme.headline3,),
                             ],
                           ),
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
                         ),
                         Container(
                           width: MediaQuery.of(context).size.width - 220,
                           height: 60,
                           margin: const EdgeInsets.only(left: 20, top: 40, bottom: 84),
                           padding: const EdgeInsets.all(5),
                           child: Column(
                             children: [
                               Text('Status',style: Theme.of(context).textTheme.headline3,),
                             ],
                           ),
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
                         )
                       ],
                     ),
                     Container(
                         width: MediaQuery.of(context).size.width - 80,
                         height: 60,
                         decoration: BoxDecoration(
                             color: Theme.of(context).cardColor,
                             borderRadius: BorderRadius.circular(15),
                           border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                         ),
                         child: FloatingActionButton.extended(
                           onPressed: () => context.go('/AJadwal'
                           ),
                           foregroundColor: Theme.of(context).primaryColor,
                           backgroundColor: Theme.of(context).cardColor,
                           icon : const Icon (Icons.add,size: 36,), label: const Text("Pilih Perangkat"),
                         )
                     ),
                   ],
                 ),
               ),
           ],
         ),

    );
  }
  }
