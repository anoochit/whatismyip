import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:whatismyip/src/models/ipgeolocation.dart';

/// A class that provides functionality to retrieve IP addresses and their geolocation information.
///
/// This class uses two external APIs:
/// * Ipify API (https://api.ipify.org) to get the current IP address
/// * IP2Location API (https://api.ip2location.io) to get geolocation data for an IP address
///
/// Example usage:
/// ```dart
/// final ipService = WhatIsMyIp();
///
/// // Get current IP address
/// final ipAddress = await ipService.getIpAddress();
///
/// // Get geolocation for current IP
/// final geolocation = await ipService.getIpGeolocation(
///   apiKey: 'your_api_key_here'
/// );
///
/// // Get geolocation for specific IP
/// final specificGeolocation = await ipService.getIpGeolocation(
///   apiKey: 'your_api_key_here',
///   ip: '8.8.8.8'
/// );
/// ```
class WhatIsMyIp {
  /// The endpoint URL for the Ipify API service.
  final String _ipifyEndpoint = 'https://api.ipify.org';

  /// Retrieves the current IP address using the Ipify API.
  ///
  /// Makes a GET request to the Ipify API endpoint to fetch the current IP address.
  ///
  /// Returns a [Future<String>] containing the IP address if successful.
  ///
  /// Throws an exception if:
  /// * The API request fails
  /// * The response status code is not 200 (OK)
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

  /// Retrieves geolocation information for an IP address using the IP2Location API.
  ///
  /// Parameters:
  /// * [apiKey] - Required. Your IP2Location API key
  /// * [ip] - Optional. The IP address to look up. If not provided, the current IP address will be used
  ///
  /// Returns a [Future<IpGeolocation>] containing the geolocation information if successful.
  ///
  /// The returned [IpGeolocation] object contains detailed information about the IP address location,
  /// including country, region, city, and other geographical data.
  ///
  /// Throws an exception if:
  /// * The API request fails
  /// * The response status code is not 200 (OK)
  /// * The IP address retrieval fails (when no IP is provided)
  Future<IpGeolocation> getIpGeolocation({
    required String apiKey,
    String? ip,
  }) async {
    String yourIp = '';
    try {
      if (ip == null) {
        yourIp = await getIpAddress();
      } else {
        yourIp = ip;
      }

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
