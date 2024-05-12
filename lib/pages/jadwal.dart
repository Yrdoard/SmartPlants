import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:smartplants/widgets/stack_w.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key,});

  @override
  State <JadwalPage> createState() => _JadwalPage();
}
class _JadwalPage extends State<JadwalPage> {
  double pro = 0.0;
  double temppro = 0.0;
  DateTime _selectedDate = DateTime.now();
  // TimeOfDay _timeOfDay = TimeOfDay.now();
  // TimeOfDay  tempTime = TimeOfDay.now();
  List<bool> isPressed = [false, false, false, false, false, false, false];
  List<String> labels = ['S', 'S', 'R', 'K', 'J', 'S', 'M'];
  String savedTimeText = '';
  String output = '';
  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    savedTimeText = '${now.hour}:${now.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Stack(
          children: [
            Image.asset('assets/image/tanamanBg.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color.fromARGB(200, 192, 204, 71),
              colorBlendMode: BlendMode.srcOver,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,),
          SafeArea(
            child:Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20,),
                    child: Text('Jadwal',
                      style: Theme.of(context).textTheme.headline1
                    ),
                  ),
                  const JstackW(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 240,
                        height: 60,
                        margin: const EdgeInsets.only(top: 54),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color:
                            Theme.of(context).cardColor,
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
                            Text('Waktu',style: Theme.of(context).textTheme.headline2),
                            const SizedBox(height: 3),
                            Text(savedTimeText,
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 60,
                        margin: const EdgeInsets.only(top: 54),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                        child: FutureBuilder<double>(
                          future: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            return prefs.getDouble('pro') ?? 0.0;
                          }(),
                          builder: (BuildContext context, AsyncSnapshot<double> snapshot){
                            if (snapshot.connectionState == ConnectionState.waiting){
                              return  CircularProgressIndicator();
                            } else{
                              return Column(
                                children: [
                                  Text('Kelembapan',style: Theme.of(context).textTheme.headline2,),
                                  const SizedBox(height: 3),
                                  Text('${snapshot.data?.toInt() == 0 ? 0 : (snapshot.data?.toInt() ?? 0) + 1}%',style: Theme.of(context).textTheme.bodyText1,),
                                ],
                              );
                            }
                          },
                        )
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 100,
                    margin: const EdgeInsets.only(top: 38, bottom: 60),
                    padding: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                        Text('Hari',style: Theme.of(context).textTheme.headline2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(7, (index) {
                            return Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: isPressed[index] ? Theme.of(context).primaryColor : Colors.white,
                                border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(labels[index], style: TextStyle(color: isPressed[index] ? Colors.white : Theme.of(context).primaryColor, fontSize: 15, fontWeight: FontWeight.w700,)),
                              ),
                            );
                          }),
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
                        onPressed: (){
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: const Color.fromARGB(255, 231, 228, 228),
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
                              builder: (context) => SizedBox(
                                    height: 440,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.only(top: 10),
                                              width: MediaQuery.of(context).size.width,
                                              height: 200,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 0, 111, 18),
                                                        borderRadius: BorderRadius.circular(15)
                                                    )
                                                  ),
                                                  Text('Atur Jadwal',style: TextStyle(
                                                      color: Theme.of(context).primaryColor,
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.w800
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: MediaQuery.of(context).size.width - 220,
                                                        width: 120,
                                                        margin: const EdgeInsets.only(top: 5),
                                                        padding: const EdgeInsets.only(top: 5),
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
                                                                Text('Atur Waktu',style: Theme.of(context).textTheme.headline3),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width - 250,
                                                                  height: 100,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors.white,
                                                                      borderRadius: BorderRadius.circular(15),
                                                                      border: Border.all(color: Theme.of(context).primaryColor, width: 2)
                                                                  ),
                                                                  child: TimePickerSpinner(
                                                                    is24HourMode: true,
                                                                    alignment: Alignment.center,
                                                                    spacing: 10,
                                                                    highlightedTextStyle: TextStyle(
                                                                      fontSize: 18,
                                                                      color: Color.fromARGB(255, 0, 111, 18),
                                                                    ),
                                                                    normalTextStyle: TextStyle(
                                                                      fontSize: 13,
                                                                      color: Colors.grey,
                                                                    ),
                                                                    time: _selectedDate,
                                                                    onTimeChange: (time) {
                                                                      setState(() {
                                                                        _selectedDate = time;
                                                                      });
                                                                    },
                                                                    itemWidth: 25,
                                                                    itemHeight: 25,
                                                                    isForce2Digits: true,
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                      ),
                                                      Container(
                                                          width: MediaQuery.of(context).size.width - 220,
                                                          height: 140,
                                                          padding: const EdgeInsets.only(top: 5),
                                                          margin: const EdgeInsets.only(top: 5),
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
                                                              borderRadius: BorderRadius.circular(20)
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Text('Kelembapan',style: Theme.of(context).textTheme.headline3),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              SleekCircularSlider(
                                                                appearance: CircularSliderAppearance(
                                                                    infoProperties: InfoProperties(
                                                                      mainLabelStyle: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight.w700
                                                                      )
                                                                    ),
                                                                    angleRange: 360,
                                                                    startAngle: 270,
                                                                    size: 100,
                                                                    customColors: CustomSliderColors(
                                                                      hideShadow: true,
                                                                      progressBarColor: const Color.fromARGB(255, 115, 64, 64),
                                                                      trackColor: Colors.white
                                                                    ),
                                                                    customWidths: CustomSliderWidths(
                                                                        progressBarWidth: 10.0, trackWidth: 10.0
                                                                    )
                                                                ),
                                                                initialValue: pro,
                                                                max: 100,
                                                                onChange: (double value) async {
                                                                  setState(() {
                                                                    temppro = value;
                                                                  });
                                                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                  await prefs.setDouble('pro', pro);
                                                                },
                                                              ),
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width - 80,
                                            height: 100,
                                            margin: const EdgeInsets.only(top: 18, bottom: 50),
                                            padding: const EdgeInsets.only(top: 5),
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
                                                Text('Hari',style: Theme.of(context).textTheme.headline3,),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: List.generate(7, (index) {
                                                    return StatefulBuilder(
                                                      builder: (BuildContext context, StateSetter setState) {
                                                        return Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                                      (Set<MaterialState> states) {
                                                                    if (states.contains(MaterialState.pressed) || isPressed[index])
                                                                      return Theme.of(context).primaryColor;
                                                                    return Colors.white;
                                                                  },
                                                                ),
                                                                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                                                      (Set<MaterialState> states) {
                                                                    if (states.contains(MaterialState.pressed) || isPressed[index])
                                                                      return Colors.white;
                                                                    return Colors.black;
                                                                  },
                                                                ),
                                                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                                                                shape: MaterialStateProperty.all<CircleBorder>(
                                                                    CircleBorder(
                                                                        side: BorderSide(color: Theme.of(context).primaryColor)
                                                                    )
                                                                )
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                isPressed[index] = !isPressed[index];
                                                                output = labels[index];
                                                              });
                                                            },
                                                            child: Text(labels[index]),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 110,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context).cardColor,
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(color: Theme.of(context).primaryColor, width: 2)
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Batal'),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: 110,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context).primaryColor,
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: ElevatedButton(
                                                    onPressed: () async {
                                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                                      await prefs.setDouble('pro', temppro);
                                                      await prefs.setInt('selectedHour', _selectedDate.hour);
                                                      await prefs.setInt('selectedMinute', _selectedDate.minute);
                                                      // await prefs.setString('pickedTime', tempTime.format(context));
                                                      await prefs.setString('output', output);
                                                      setState(() {
                                                        savedTimeText = '${_selectedDate.hour}:${_selectedDate.minute}';
                                                        pro = temppro;
                                                        // _timeOfDay = tempTime;
                                                        int index = isPressed.indexWhere((element) => element == true);
                                                        if (index != -1) {
                                                          output = labels[index];
                                                        } else {
                                                          output = '';
                                                        }
                                                      });
                                                    },
                                                    child: const Text('Simpan', style: TextStyle(color: Colors.white,),)
                                                  ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              );
                        },
                        child: Column(
                          children: [
                            const Icon(Icons.add,size: 36,),
                            Text('Atur Jadwal',style:
                            TextStyle(color: Color.fromARGB(255, 103, 239, 108), fontSize: 11, fontWeight: FontWeight.w500,),)
                          ],
                        ),
                      )
                  )
                ]
              ),
            )
          ],
        ),
    );
  }
}
// void main(List<String> arguments) async {
//   var url =
//   Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
//
//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(url);
//   if (response.statusCode == 200) {
//     var jsonResponse =
//     convert.jsonDecode(response.body) as Map<String, dynamic>;
//     var itemCount = jsonResponse['totalItems'];
//     print('Number of books about http: $itemCount.');
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }
