Future _aturjadwal(BuildContext context){
  return showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(255, 173, 189, 14),
      barrierColor: Colors.black87.withOpacity(0.5),
      isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(0.5))),
      builder: (context) => StatefulBuilder(  // Here is the StatefulBuilder
      builder: (BuildContext context, StateSetter setState{

  }
    Container(
        height: 500,
        child: Center(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Column(
                    children: [
                      Text('Atur Jadwal',style: Theme.of(context).textTheme.caption,),
                      Row(
                        children: [
                          Container(
                            height: 140,
                            width: 120,
                            margin: EdgeInsets.only(top: 0),
                            padding: EdgeInsets.all(10),
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
                                  style: TextStyle(fontSize: 11),
                                ),
                                // button
                                MaterialButton(
                                  onPressed: _showTimePicker,
                                  child: const Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text('PICK TIME',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: 140,
                              height: 140,
                              margin: EdgeInsets.only(left: 5),
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
                                  Text('Kelembapan',style: Theme.of(context).textTheme.caption,),
                                  SleekCircularSlider(
                                    appearance: CircularSliderAppearance(
                                        infoProperties: InfoProperties(),
                                        angleRange: 360,
                                        startAngle: 180,
                                        size: 90,
                                        customColors: CustomSliderColors(
                                          hideShadow: true,
                                          progressBarColor: Color.fromARGB(255, 103, 239, 108),
                                        ),
                                        customWidths: CustomSliderWidths(
                                            progressBarWidth: 10.0, trackWidth: 5.0
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
                width: MediaQuery.of(context).size.width - 80,
                height: 100,
                margin: const EdgeInsets.only(top: 18),
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
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0),
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
                                        side: BorderSide(
                                            width: 2,
                                            color: Colors.white
                                        )
                                    )
                                ),
                                backgroundColor: MaterialStateProperty.all((click1 == false)? Colors.green : Colors.white)
                              backgroundColor: (click1 == false)? Colors.green : Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('S',style: Theme.of(context).textTheme.headline2),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
  );
}