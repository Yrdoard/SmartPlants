import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:smartplants/widgets/stack_w.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key,});

  @override
  State <JadwalPage> createState() => _JadwalPage();
}
class _JadwalPage extends State<JadwalPage> {
  double pro = 0;
  bool click1 = true;
  TimeOfDay _timeOfDay = TimeOfDay.now();

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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            Text(_timeOfDay.format(context).toString(),
                              style: Theme.of(context).textTheme.bodyText1
                            ),
                          ],
                        ),
                      ),
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
                            Text('kelembapan',style: Theme.of(context).textTheme.headline2),
                            const SizedBox(height: 3),
                            Text("$pro%",
                              style: Theme.of(context).textTheme.bodyText1
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 100,
                    margin: const EdgeInsets.only(top: 38, bottom: 60),
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
                        const Row(
                          children: [
                            // Container(
                            //   margin: EdgeInsets.only(left: 0),
                            //   height: 40,
                            //   width: 40,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(0)
                            //   ),
                            //   child: ElevatedButton(
                            //     onPressed: (){
                            //       setState(() {
                            //         click1 = !click1;
                            //       });
                            //     },
                            //       style: ButtonStyle(
                            //         shape: MaterialStateProperty.all(
                            //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                            //             side: BorderSide(
                            //               width: 2,
                            //               color: Colors.white
                            //             )
                            //           )
                            //         ),
                            //         backgroundColor: MaterialStateProperty.all((click1 == false)? Colors.green : Colors.white)
                            //         // backgroundColor: (click1 == false)? Colors.green : Colors.white,
                            //       ),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Text('S',style: Theme.of(context).textTheme.headline2),
                            //       ],
                            //     ),
                            //     ),
                            //   ),
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
                                                        height: 140,
                                                        width: 120,
                                                        margin: const EdgeInsets.only(top: 5),
                                                        padding: const EdgeInsets.only(top: 22),
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
                                                        child: Column(
                                                              children: [
                                                                Text(
                                                                  _timeOfDay.format(context).toString(),
                                                                  style: const TextStyle(
                                                                      color: Color.fromARGB(255, 103, 239, 108),
                                                                      fontSize: 30,
                                                                      fontWeight: FontWeight.w700
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Container(
                                                                  width: 88,
                                                                  height: 30,
                                                                  decoration: BoxDecoration(
                                                                      color: Theme.of(context).cardColor,
                                                                      borderRadius: BorderRadius.circular(15),
                                                                      border: Border.all(color: Theme.of(context).primaryColor, width: 2)
                                                                  ),
                                                                  child: FloatingActionButton(
                                                                    onPressed: (){
                                                                      showTimePicker(
                                                                        context: context,
                                                                        initialTime: _timeOfDay,
                                                                      ).then((value) {
                                                                        setState(() {
                                                                          _timeOfDay = value!;
                                                                        });
                                                                      }
                                                                      );
                                                                    },
                                                                    child: Text('Atur Waktu',style: Theme.of(context).textTheme.headline2,),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                      ),
                                                      Container(
                                                          width: 140,
                                                          height: 140,
                                                          padding: const EdgeInsets.only(top: 5),
                                                          margin: const EdgeInsets.only(left: 5),
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
                                                                onChange: (value){
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
                                            width: MediaQuery.of(context).size.width - 60,
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
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    StatefulBuilder(
                                                      builder: (BuildContext context, StateSetter setState){
                                                        return Container(
                                                          margin: const EdgeInsets.only(left: 0),
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(0)
                                                          ),
                                                          child: ElevatedButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                click1 = !click1;
                                                              });
                                                            },
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                                                        side: const BorderSide(
                                                                            width: 2,
                                                                            color: Colors.white
                                                                        )
                                                                    )
                                                                ),
                                                                backgroundColor: MaterialStateProperty.all((click1 == false)? Colors.green : Colors.white)
                                                              // backgroundColor: (click1 == false)? Colors.green : Colors.white,
                                                            ),
                                                            child: const Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                // Text('S',style: Theme.of(context).textTheme.headline2),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    StatefulBuilder(
                                                      builder: (BuildContext context, StateSetter setState){
                                                        return Container(
                                                          margin: const EdgeInsets.only(left: 0),
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(0)
                                                          ),
                                                          child: ElevatedButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                click1 = !click1;
                                                              });
                                                            },
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                                                        side: const BorderSide(
                                                                            width: 2,
                                                                            color: Colors.white
                                                                        )
                                                                    )
                                                                ),
                                                                backgroundColor: MaterialStateProperty.all((click1 == false)? Colors.green : Colors.white)
                                                              // backgroundColor: (click1 == false)? Colors.green : Colors.white,
                                                            ),
                                                            child: const Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                // Text('S',style: Theme.of(context).textTheme.headline2),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    StatefulBuilder(
                                                      builder: (BuildContext context, StateSetter setState){
                                                        return Container(
                                                          margin: const EdgeInsets.only(left: 0),
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(0)
                                                          ),
                                                          child: ElevatedButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                click1 = !click1;
                                                              });
                                                            },
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                                                        side: const BorderSide(
                                                                            width: 2,
                                                                            color: Colors.white
                                                                        )
                                                                    )
                                                                ),
                                                                backgroundColor: MaterialStateProperty.all((click1 == false)? Colors.green : Colors.white)
                                                              // backgroundColor: (click1 == false)? Colors.green : Colors.white,
                                                            ),
                                                            child: const Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                // Text('S',style: Theme.of(context).textTheme.headline2),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    StatefulBuilder(
                                                      builder: (BuildContext context, StateSetter setState){
                                                        return Container(
                                                          margin: const EdgeInsets.only(left: 0),
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(0)
                                                          ),
                                                          child: ElevatedButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                click1 = !click1;
                                                              });
                                                            },
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                                                        side: const BorderSide(
                                                                            width: 2,
                                                                            color: Colors.white
                                                                        )
                                                                    )
                                                                ),
                                                                backgroundColor: MaterialStateProperty.all((click1 == false)? Colors.green : Colors.white)
                                                              // backgroundColor: (click1 == false)? Colors.green : Colors.white,
                                                            ),
                                                            child: const Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                // Text('S',style: Theme.of(context).textTheme.headline2),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    StatefulBuilder(
                                                      builder: (BuildContext context, StateSetter setState){
                                                        return Container(
                                                          margin: const EdgeInsets.only(left: 0),
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(0)
                                                          ),
                                                          child: ElevatedButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                click1 = !click1;
                                                              });
                                                            },
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                                                        side: const BorderSide(
                                                                            width: 2,
                                                                            color: Colors.white
                                                                        )
                                                                    )
                                                                ),
                                                                backgroundColor: MaterialStateProperty.all((click1 == false)? Colors.green : Colors.white)
                                                              // backgroundColor: (click1 == false)? Colors.green : Colors.white,
                                                            ),
                                                            child: const Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                // Text('S',style: Theme.of(context).textTheme.headline2),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    StatefulBuilder(
                                                      builder: (BuildContext context, StateSetter setState){
                                                        return Container(
                                                          margin: const EdgeInsets.only(left: 0),
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(0)
                                                          ),
                                                          child: ElevatedButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                click1 = !click1;
                                                              });
                                                            },
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                                                        side: const BorderSide(
                                                                            width: 2,
                                                                            color: Colors.white
                                                                        )
                                                                    )
                                                                ),
                                                                backgroundColor: MaterialStateProperty.all((click1 == false)? Colors.green : Colors.white)
                                                              // backgroundColor: (click1 == false)? Colors.green : Colors.white,
                                                            ),
                                                            child: const Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                // Text('S',style: Theme.of(context).textTheme.headline2),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    StatefulBuilder(
                                                      builder: (BuildContext context, StateSetter setState){
                                                        return Container(
                                                          margin: const EdgeInsets.only(left: 0),
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(0)
                                                          ),
                                                          child: ElevatedButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                click1 = !click1;
                                                              });
                                                            },
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                                                        side: const BorderSide(
                                                                            width: 2,
                                                                            color: Colors.white
                                                                        )
                                                                    )
                                                                ),
                                                                backgroundColor: MaterialStateProperty.all((click1 == false)? Colors.green : Colors.white)
                                                              // backgroundColor: (click1 == false)? Colors.green : Colors.white,
                                                            ),
                                                            child: const Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                // Text('S',style: Theme.of(context).textTheme.headline2),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                )
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
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Simpan',style: TextStyle(color: Colors.white),),
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                                                  ),
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
                            Text('Atur Jadwal',style: Theme.of(context).textTheme.headline2)
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
void main(List<String> arguments) async {
  var url =
  Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
