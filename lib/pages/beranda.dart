import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:smartplants/app/api_service.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _Beranda();
}
class _Beranda extends State<Beranda> {
  int? selectedDeviceId;
  double? kelembapanTerkini;
  String? status;
  final apiService = HomepageService();

  String getCondition() {
    if (kelembapanTerkini != null) {
      if (kelembapanTerkini! <= 20) {
        return 'Kering';
      } else if (kelembapanTerkini! > 20 && kelembapanTerkini! <= 80) {
        return 'Normal';
      } else if (kelembapanTerkini! > 80) {
        return 'Lembab';
      }
    }
    return 'null';
  }

  void loadDevice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? deviceId = prefs.getInt('selectedDeviceId');
    if (deviceId != null) {
      var deviceData = await apiService.fetchDeviceData(deviceId);
      setState(() {
        kelembapanTerkini = (deviceData['kelembapan_terkini'] as num).toDouble();
        status = deviceData['status'];
        selectedDeviceId = deviceId; // Set selectedDeviceId saat loadDevice
      });
    }
    // Tambahkan delay 5 detik
    await Future.delayed(Duration(seconds: 5));
    // Panggil ulang fungsi setelah delay
    loadDevice();
  }

  @override
  void initState() {
    super.initState();
    apiService.fetchDevices().then((deviceNames) {
      // Lakukan sesuatu dengan deviceNames
    });
    loadDevice();

}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child:  Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 67, 160, 71),
                        Color.fromARGB(255, 154, 174, 155)
                      ]
                  )
              )
            ),
            Opacity(
              opacity: 0.2,
              child: Image.asset('assets/image/tanamanBg.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                colorBlendMode: BlendMode.srcOver,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,),
            ),
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
                                borderRadius: BorderRadius.circular(20)
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
                                        pointers: <GaugePointer>[
                                          RangePointer(
                                            enableAnimation: true,
                                            animationDuration: 3000,
                                            value: kelembapanTerkini ?? 0,
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
                                        annotations: <GaugeAnnotation>[
                                          GaugeAnnotation(
                                            axisValue: 50,
                                            positionFactor: 0.2,
                                            widget: Text('${kelembapanTerkini?.toInt().toString() ?? '0'} %', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
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
                            children: [
                              Expanded(
                                child: Container(
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
                                      Text('Kondisi Tanah',style: Theme.of(context).textTheme.headlineSmall,),
                                      const SizedBox(height: 5),
                                      Text(getCondition(), style: Theme.of(context).textTheme.bodyMedium,),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
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
                                      Text('Status Pompa',style: Theme.of(context).textTheme.headlineSmall,),
                                      const SizedBox(height: 5),
                                      Text(
                                        status == 'hidup' ? 'Sedang Menyiram' : 'Tidak Menyiram',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
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
                              return StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Center(
                                    child: Container(
                                      height: 380,
                                      width: 320,
                                      padding: const EdgeInsets.all(27),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 254, 244, 244),
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color: Theme.of(context).primaryColor, width: 1)
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(bottom: 20),
                                            child: Text('Pilih Perangkat', style: Theme.of(context).textTheme.bodyLarge),
                                          ),
                                          FutureBuilder<List<Device>>(
                                            future: apiService.fetchDevices(),
                                            builder: (BuildContext context, AsyncSnapshot<List<Device>> snapshot) {
                                              if (snapshot.hasData) {
                                                return Column(
                                                  children: snapshot.data!.map((device) {
                                                    return Container(
                                                      margin: const EdgeInsets.only(bottom: 10),
                                                      width: 240,
                                                      height: 60,
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor: WidgetStateProperty.resolveWith<Color>(
                                                                (Set<WidgetState> states) {
                                                              if (selectedDeviceId == device.id) {
                                                                return Theme.of(context).primaryColor; // Warna saat perangkat dipilih
                                                              }
                                                              return Colors.white; // Warna default
                                                            },
                                                          ),
                                                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15.0),
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () async {
                                                          var deviceData = await apiService.fetchDeviceData(device.id);
                                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                                          await prefs.setInt('selectedDeviceId', device.id);
                                                          setState(() {
                                                            kelembapanTerkini = (deviceData['kelembapan_terkini'] as num).toDouble();
                                                            status = deviceData['status'];
                                                            selectedDeviceId = device.id; // Set selectedDeviceId saat perangkat dipilih
                                                          });
                                                        },
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            device.name,
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.w800,
                                                              color: selectedDeviceId == device.id ? Colors.white : Theme.of(context).primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                );
                                              } else if (snapshot.hasError) {
                                                return Text('Error: ${snapshot.error}');
                                              } else {
                                                return const CircularProgressIndicator();
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ).then((_) {
                            loadDevice();
                          });
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
      )
    );
  }
}
