# WhatIsMyIP

A lightweight Dart package that helps you discover your IP address and retrieve detailed geolocation information. This package integrates with Ipify for IP address lookup and IP2Location for geolocation data.

## Features

- Get your current IP address (ISP IP Address)
- Retrieve detailed geolocation information including:
  - Country code and name
  - Region and city
  - Latitude and longitude
  - ZIP code
  - Time zone
  - ASN (Autonomous System Number) information
  - Proxy detection

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  whatismyip: ^1.0.0
```

Then run:

```bash
dart pub get
```

## Usage

### Basic Example

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

### Running the Example

To run the example with your IP2Location API key

```bash
dart run --define=IP2LOCATION_API=your_api_key_here main.dart
```

``bash
flutter run --dart-define=IP2LOCATION_API=$env:your_api_key_here
```

### Sample Output

```text
IP Address = 171.101.99.209
My City = Nakhon Ratchasima
{
  ip: 171.101.99.209,
  country_code: TH,
  country_name: Thailand,
  region_name: Nakhon Ratchasima,
  city_name: Nakhon Ratchasima,
  latitude: 14.97066,
  longitude: 102.10196,
  zip_code: 30280,
  time_zone: +07:00,
  asn: 17552,
  as: True Online,
  is_proxy: false
}
```

## API Reference

### WhatIsMyIp Class

#### `getIpAddress()`
Returns the current IP address as a string.

#### `getIpGeolocation({required String apiKey})`
Returns detailed geolocation information for the current IP address.

Parameters:
- `apiKey`: Your IP2Location API key (required)

Returns an `IpGeolocation` object containing:
- `ip`: The IP address
- `countryCode`: Two-letter country code
- `countryName`: Full country name
- `regionName`: Region/state name
- `cityName`: City name
- `latitude`: Location latitude
- `longitude`: Location longitude
- `zipCode`: Postal/ZIP code
- `timeZone`: Time zone
- `asn`: Autonomous System Number
- `ipGeolocationAs`: AS name/description
- `isProxy`: Proxy detection status

## Prerequisites

- Sign up for an [IP2Location API key](https://www.ip2location.io/) to access geolocation data
- Dart SDK version 2.12.0 or higher

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Acknowledgments

- [Ipify](https://www.ipify.org/) for IP address lookup service
- [IP2Location](https://www.ip2location.io/) for geolocation data