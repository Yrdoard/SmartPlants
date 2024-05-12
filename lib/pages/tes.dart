import 'package:flutter/material.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tes extends StatefulWidget {
  const tes({super.key,});

  @override
  State <tes> createState() => _tes();
}
class _tes extends State<tes> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();
  String savedTimeText = ''; // Variabel baru untuk menyimpan teks output

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atur Jadwal'),
      ),
      body: Column(
        children: <Widget>[
          TimePickerSpinner(
            is24HourMode: true,
            highlightedTextStyle: TextStyle(
              fontSize: 18,
              color: Colors.red,
            ),
            normalTextStyle: TextStyle(
              fontSize: 18,
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
          ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              // Simpan hanya jam dan menit
              await prefs.setInt('selectedHour', _selectedDate.hour);
              await prefs.setInt('selectedMinute', _selectedDate.minute);
              // Atur teks output
              setState(() {
                savedTimeText = 'Waktu yang disimpan: ${_selectedDate.hour}:${_selectedDate.minute}';
              });
            },
            child: Text('Simpan'),
          ),
          Text(savedTimeText,
              style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}