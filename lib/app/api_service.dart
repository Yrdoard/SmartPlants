import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
final public = 'https://smartplants.yrdard.my.id/api/data';
final local = 'http://192.168.1.68:3000/api/data';


class Device {
  final int id;
  final String name;

  Device({required this.id, required this.name});
}

class HomepageService {
Future<Map<String, dynamic>> fetchDeviceData(int deviceId) async {
  final response = await http.get(Uri.parse(public)); // Keep the same API endpoint
  var jsonResponse = json.decode(response.body);

  if (jsonResponse is List) {
    var deviceData = jsonResponse.firstWhere((item) => item['id'] == deviceId); // Find the device with the matching id
    if (deviceData != null) {
      return deviceData.cast<String, dynamic>(); // Cast keys to String
    } else {
      throw Exception('No data found for device with id $deviceId');
    }
  } else {
    throw Exception('Unexpected data format returned from API');
  }
}
  Future<List<Device>> fetchDevices() async {
    final response = await http.get(Uri.parse(public));
    var jsonResponse = json.decode(response.body);
    List<Device> devices = [];
    for (var item in jsonResponse) {
      devices.add(Device(id: item['id'], name: item['nama'])); // Ganti 'id' dan 'nama' dengan nama kolom yang sesuai di database Anda
    }
    return devices;
  }
}

class JadwalService {
  Future<Map<String, dynamic>> fetchSelectedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int deviceId = prefs.getInt('selectedDeviceId') ?? 0;
    return fetchData(deviceId);
  }

  Future<Map<String, dynamic>> fetchData(int deviceId) async {
    final response = await http.get(Uri.parse(public)); // Keep the same API endpoint
    var jsonResponse = json.decode(response.body);

    if (jsonResponse is List) {
      var deviceData = jsonResponse.firstWhere((item) => item['id'] == deviceId); // Find the device with the matching id
      if (deviceData != null) {
        return deviceData.cast<String, dynamic>(); // Cast keys to String
      } else {
        throw Exception('No data found for device with id $deviceId');
      }
    } else {
      throw Exception('Unexpected data format returned from API');
    }
  }
}
class UpdateJadwal{
  Future<void> hariUpdate(int id_tanaman, List<int> activeDays) async {
    var data = <String, dynamic>{
      'id_tanaman': id_tanaman,
      'hari': activeDays,
    };

    print('Sending data: $data');

    await http.put(
      Uri.parse(public), // use local endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(data),
    );
  }

  Future<void> waktuKelembapanUpdate(int id_tanaman, DateTime selectedTime, double batasKelembapan) async {
    final String formattedTime = '${selectedTime.hour.toString().padLeft(
        2, '0')}:${selectedTime.minute.toString().padLeft(
        2, '0')}:${selectedTime.second.toString().padLeft(2, '0')}';

    batasKelembapan += 1;

    var data = {
      'id_tanaman': id_tanaman,
      'waktu': formattedTime,
      'batas_kelembapan': batasKelembapan.toInt(),
    };

    print('Sending data: $data');

    await http.put(
      Uri.parse(public), // use local endpoint
      body: json.encode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}