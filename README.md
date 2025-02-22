# What is my IP Address

A simple Dart package allow you to find your IP Address (ISP IP Address) and geolocation data, using Ipify and IP2LOCATION API.

## Example

```dart
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
```

Run

```sh
dart run --define=IP2LOCATION_API=$env:IP2LOCATION_API  main.dart
```

Result

```text
IP Address = 171.101.99.209
My City = Nakhon Ratchasima
{ip: 171.101.99.209, country_code: TH, country_name: Thailand, region_name: Nakhon Ratchasima, city_name: Nakhon Ratchasima, latitude: 14.97066, longitude: 102.10196, zip_code: 30280, time_zone: +07:00, asn: 17552, as: True Online, is_proxy: false}
```