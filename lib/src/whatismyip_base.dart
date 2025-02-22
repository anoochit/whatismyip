import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:whatismyip/src/models/ipgeolocation.dart';

class WhatIsMyIp {
  final String _ipifyEndpoint = 'https://api.ipify.org';

  Future<String> getIpAddress() async {
    try {
      final res = await http.get(Uri.parse(_ipifyEndpoint));

      if (res.statusCode == HttpStatus.ok) {
        return res.body;
      } else {
        throw ('Cannot access Ipify API endpoint');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<IpGeolocation> getIpGeolocation({required String apiKey}) async {
    try {
      final yourIp = await getIpAddress();

      final ip2locationEndpoint =
          'https://api.ip2location.io/?key=$apiKey&ip=$yourIp';

      final res = await http.get(Uri.parse(ip2locationEndpoint));

      if (res.statusCode == HttpStatus.ok) {
        return ipGeolocationFromJson(res.body);
      } else {
        throw ('Cannot access IP2LOCATION API endpoint');
      }
    } catch (e) {
      rethrow;
    }
  }
}
