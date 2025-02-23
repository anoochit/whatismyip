import 'package:whatismyip/whatismyip.dart';

Future<void> main() async {
  var apiKey = String.fromEnvironment("IP2LOCATION_API");

  var whatismyip = WhatIsMyIp();
  var myip = await whatismyip.getIpAddress();
  print('IP Address = $myip');

  var ipgeolocation = await whatismyip.getIpGeolocation(apiKey: apiKey);

  print('My City = ${ipgeolocation.cityName}');

  print('${ipgeolocation.toJson()}');
}
