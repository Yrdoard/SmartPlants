import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smartplants/app/api_service.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';
import 'package:smartplants/widgets/stack_w.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({Key? key});

  @override
  State<JadwalPage> createState() => _JadwalPage();
}

class _JadwalPage extends State<JadwalPage> {
  List<String> days = ['M', 'S', 'S', 'R', 'K', 'J', 'S'];
  List<int> activeDays = [];
  double? batasKelembapan;
  String? waktuPenyiraman;
  final apiService = JadwalService();
  List<bool> activeDaysStatus = List<bool>.filled(7, false);

  DateTime _selectedTime = DateTime.now();

  Future<void> fetchData() async {
    try {
      var value = await apiService.fetchSelectedData();
      setState(() {
        waktuPenyiraman = value['waktu'];
        batasKelembapan = (value['batas_kelembapan'] as num).toDouble();
        activeDays = List<int>.from(value['hari'].map((item) => item as int));
        activeDaysStatus = List<bool>.filled(7, false);
        for (int day in activeDays) {
          if (day >= 0 && day <= 6) {
            activeDaysStatus[day] = true;
          }
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
void aturJadwal() {
  showModalBottomSheet(
    backgroundColor: Color.fromARGB(255, 222, 222, 222),
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child: Image.asset('assets/image/tanamanBg.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  colorBlendMode: BlendMode.srcOver,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 111, 18),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          'Atur Jadwal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 250,
                            height: 140,
                            padding: const EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text('Atur Waktu', style: Theme.of(context).textTheme.headlineSmall),
                                SizedBox(height: 5),
                                Container(
                                  width: MediaQuery.of(context).size.width - 235,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor.withOpacity(0.05),
                                  ),
                                  child: TimePickerSpinner(
                                    is24HourMode: true,
                                    alignment: Alignment.center,
                                    spacing: 10,
                                    highlightedTextStyle: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    normalTextStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                    time: _selectedTime,
                                    onTimeChange: (time) {
                                      setState(() {
                                        _selectedTime = time;
                                      });
                                    },
                                    itemWidth: 25,
                                    itemHeight: 25,
                                    isForce2Digits: true,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 200,
                            height: 140,
                            padding: const EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text('Atur Kelembapan', style: Theme.of(context).textTheme.headlineSmall),
                                const SizedBox(height: 10),
                                SleekCircularSlider(
                                  appearance: CircularSliderAppearance(
                                    infoProperties: InfoProperties(
                                      mainLabelStyle: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    angleRange: 360,
                                    startAngle: 270,
                                    size: 100,
                                    customColors: CustomSliderColors(
                                      hideShadow: true,
                                      progressBarColor: const Color.fromARGB(255, 115, 64, 64),
                                      trackColor: Colors.grey.withOpacity(0.3),
                                    ),
                                    customWidths: CustomSliderWidths(
                                      progressBarWidth: 10.0,
                                      trackWidth: 10.0,
                                    ),
                                  ),
                                  initialValue: 0,
                                  max: 100,
                                  onChange: (double value) async {
                                    setState(() {
                                      batasKelembapan = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 80,
                        height: 80,
                        margin: const EdgeInsets.only(top: 25, bottom: 30),
                        padding: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text('Atur Hari', style: Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: days.asMap().entries.map((entry) {
                                int idx = entry.key;
                                String day = entry.value;
                                bool isActive = activeDaysStatus[idx];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      activeDaysStatus[idx] = !activeDaysStatus[idx];
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: isActive ? Theme.of(context).primaryColor : Colors.white,
                                      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        day,
                                        style: TextStyle(
                                          color: isActive ? Colors.white : Theme.of(context).primaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 250,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Theme.of(context).cardColor,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Batal'),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 250,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Konfirmasi'),
                                      content: const Text('Apakah Anda ingin menyimpan?'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Tidak'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Ya'),
                                          onPressed: () async {
                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                            int deviceId = prefs.getInt('selectedDeviceId') ?? 0;

                                            UpdateJadwal updateJadwal = UpdateJadwal();

                                            List<int> activeDaysToSend = [];
                                            for (int i = 0; i < activeDaysStatus.length; i++) {
                                              if (activeDaysStatus[i]) {
                                                activeDaysToSend.add(i);
                                              }
                                            }

                                            await updateJadwal.hariUpdate(deviceId, activeDaysToSend);
                                            await updateJadwal.waktuKelembapanUpdate(deviceId, _selectedTime, batasKelembapan ?? 0.0);

                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'Simpan',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              )
            ],
          );
        },
      );
    },
  ).then((_) {
    fetchData();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
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
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Jadwal',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 250, // Atur tinggi Container sesuai kebutuhan
                          width: MediaQuery.of(context).size.width, // Atur lebar Container sesuai kebutuhan
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 230,
                                margin: const EdgeInsets.only(top: 170),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              )
                            ]
                          ),
                        ),
                        Positioned(
                          top: 0, // Atur posisi top gambar tanaman
                          right: 10,
                          left: 0,
                          bottom: 20,
                          child: SizedBox(
                            height: 230, // Atur tinggi gambar tanaman sesuai kebutuhan
                            width: 200, // Atur lebar gambar tanaman sesuai kebutuhan
                            child: Image.asset('assets/image/tanamanJ.png'),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          top: 180,
                          left: 0,
                          child: SizedBox(
                            height: 50, // Atur tinggi gambar pot sesuai kebutuhan
                            width: 50, // Atur lebar gambar pot sesuai kebutuhan
                            child: Image.asset('assets/image/Ellipse2.png'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 240,
                          height: 60,
                          margin: const EdgeInsets.only(top: 40),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text('Waktu', style: Theme.of(context).textTheme.headlineSmall),
                              const SizedBox(height: 3),
                              Text((waktuPenyiraman ?? '00:00:00').substring(0, 5),
                                  style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 240,
                          height: 60,
                          margin: const EdgeInsets.only(top: 40),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text('Kelembapan', style: Theme.of(context).textTheme.headlineSmall),
                              const SizedBox(height: 3),
                              Text('${batasKelembapan?.toInt().toString() ?? '0'}%'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      height: 100,
                      margin: const EdgeInsets.only(top: 38, bottom: 40),
                      padding: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text('Hari', style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: days.asMap().entries.map((entry) {
                              int idx = entry.key;
                              String day = entry.value;
                              bool isActive = activeDaysStatus[idx];
                              return Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: isActive ? Theme.of(context).primaryColor : Colors.white,
                                  border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    day,
                                    style: TextStyle(
                                      color: isActive ? Colors.white : Theme.of(context).primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
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
                        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                      ),
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        onPressed: aturJadwal,
                        child: const Column(
                          children: [
                            Icon(Icons.add, size: 36),
                            Text(
                              'Atur Jadwal',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 103, 239, 108),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
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
      ),
    );
  }
}
