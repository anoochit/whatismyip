/// A Dart library for retrieving IP addresses and their corresponding geolocation information.
///
/// This library provides a simple interface to:
/// * Get the current IP address using the Ipify API
/// * Retrieve detailed geolocation data for any IP address using the IP2Location API
///
/// The library exports:
/// * [WhatIsMyIp] class for making API requests
/// * [IpGeolocation] model for structured geolocation data
///
/// Example usage:
/// ```dart
/// import 'package:whatismyip/whatismyip.dart';
///
/// void main() async {
///   final ipService = WhatIsMyIp();
///   final geolocation = await ipService.getIpGeolocation(
///     apiKey: 'your_api_key_here'
///   );
///   print('Country: ${geolocation.countryName}');
/// }
/// ```
library;

export 'src/whatismyip_base.dart';
export 'src/models/ipgeolocation.dart';
