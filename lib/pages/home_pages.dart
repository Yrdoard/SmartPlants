import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePageState();
}
double tes = 20 ;
class _HomePageState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Smart Plants"),
        centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 46, 160, 80),
      ),
      body: Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Container(
                    height: 285,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 46, 160, 80),
                            spreadRadius: 5,

                          ),
                        ]),
                    child: Column(
                    children: [
                        const Text("Kelembapan Tanah Saat ini :",
                              style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                    ),),
                      Container (
                          height: 200,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: SfRadialGauge(
                              axes:<RadialAxis>[RadialAxis(
                                  pointers: <GaugePointer>[RangePointer(value: tes, width: 0.1, sizeUnit: GaugeSizeUnit.factor,
                                    gradient: const SweepGradient(colors: <Color>[Color.fromRGBO(199, 150, 119, 1), Color.fromRGBO(100, 50, 0, 1)],
                                        stops: <double>[0.25, 0.75]),)],
                                  showLabels: false,
                                  startAngle: 170, endAngle: 10, canScaleToFit: true,
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(axisValue: 50, positionFactor: 0.2,
                                        widget: Text(tes.round().toString() + ("%"), style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 60),))],
                                  axisLineStyle: const AxisLineStyle(thickness: 0.1,
                                    thicknessUnit: GaugeSizeUnit.factor, color: Color.fromARGB(255, 211, 208, 208)

                                  )),
                              ])
                      )

                    ],
                    ),

                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 46, 160, 80),
                            spreadRadius: 5,
                          ),
                        ]),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const[
                          BoxShadow(
                            color: Color.fromARGB(255, 46, 160, 80),
                            spreadRadius: 5,
                          ),
                        ]),
                  )])));

}
}