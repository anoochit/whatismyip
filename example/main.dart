import 'package:whatismyip/whatismyip.dart';

/// Example demonstrating how to use the WhatIsMyIP package to retrieve
/// IP address information and geolocation data.
///
/// This example shows:
/// 1. Getting the current IP address
/// 2. Retrieving detailed geolocation information using IP2Location API
/// 3. Accessing and printing specific geolocation details
///
/// Make sure to set the IP2LOCATION_API environment variable with your API key
/// before running this example.

/// Main entry point for the example application.
///
/// This asynchronous function demonstrates the basic usage of the WhatIsMyIP
/// package, including retrieving the current IP address and its geolocation
/// information.
///
/// Throws an exception if the API request fails or if the API key is invalid.
Future<void> main() async {
  // Get the API key from environment variables
  var apiKey = String.fromEnvironment("IP2LOCATION_API");

  // Initialize the WhatIsMyIP client
  var whatismyip = WhatIsMyIp();

  // Get the current IP address
  var myip = await whatismyip.getIpAddress();
  print('IP Address = $myip');

  // Retrieve geolocation information using the IP2Location API
  var ipgeolocation = await whatismyip.getIpGeolocation(apiKey: apiKey);

  // Print specific geolocation details
  print('My City = ${ipgeolocation.cityName}');

  // Print the complete geolocation data as JSON
  print('${ipgeolocation.toJson()}');
}
