import 'dart:convert';

/// A model class representing IP geolocation data.
///
/// This class provides structured access to various geographical and network-related
/// information associated with an IP address, including location coordinates,
/// country details, and proxy status.
///
/// To parse JSON data into an [IpGeolocation] instance:
/// ```dart
/// final ipGeoData = ipGeolocationFromJson(jsonString);
/// ```
///
/// To convert an [IpGeolocation] instance to JSON:
/// ```dart
/// final jsonString = ipGeolocationToJson(ipGeoData);
/// ```

/// Converts a JSON string into an [IpGeolocation] instance.
///
/// @param str The JSON string to parse
/// @return An [IpGeolocation] instance containing the parsed data
IpGeolocation ipGeolocationFromJson(String str) =>
    IpGeolocation.fromJson(json.decode(str));

/// Converts an [IpGeolocation] instance into a JSON string.
///
/// @param data The [IpGeolocation] instance to convert
/// @return A JSON string representation of the data
String ipGeolocationToJson(IpGeolocation data) => json.encode(data.toJson());

/// Represents detailed geolocation information for an IP address.
///
/// All fields are nullable to handle cases where certain information
/// might not be available for a given IP address.
class IpGeolocation {
  /// The IP address being queried
  final String? ip;

  /// Two-letter country code (e.g., 'US', 'GB')
  final String? countryCode;

  /// Full name of the country
  final String? countryName;

  /// Name of the region/state
  final String? regionName;

  /// Name of the city
  final String? cityName;

  /// Latitude coordinate of the location
  final double? latitude;

  /// Longitude coordinate of the location
  final double? longitude;

  /// Postal/ZIP code of the location
  final String? zipCode;

  /// Time zone identifier for the location
  final String? timeZone;

  /// Autonomous System Number
  final String? asn;

  /// Autonomous System name/description
  final String? ipGeolocationAs;

  /// Indicates whether the IP is identified as a proxy
  final bool? isProxy;

  /// Creates a new [IpGeolocation] instance.
  ///
  /// All parameters are optional and can be null.
  IpGeolocation({
    this.ip,
    this.countryCode,
    this.countryName,
    this.regionName,
    this.cityName,
    this.latitude,
    this.longitude,
    this.zipCode,
    this.timeZone,
    this.asn,
    this.ipGeolocationAs,
    this.isProxy,
  });

  /// Creates an [IpGeolocation] instance from a JSON map.
  ///
  /// @param json The map containing the JSON data
  /// @return A new [IpGeolocation] instance
  factory IpGeolocation.fromJson(Map<String, dynamic> json) => IpGeolocation(
    ip: json["ip"],
    countryCode: json["country_code"],
    countryName: json["country_name"],
    regionName: json["region_name"],
    cityName: json["city_name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    zipCode: json["zip_code"],
    timeZone: json["time_zone"],
    asn: json["asn"],
    ipGeolocationAs: json["as"],
    isProxy: json["is_proxy"],
  );

  /// Converts this [IpGeolocation] instance to a JSON map.
  ///
  /// @return A map containing the object's data in JSON format
  Map<String, dynamic> toJson() => {
    "ip": ip,
    "country_code": countryCode,
    "country_name": countryName,
    "region_name": regionName,
    "city_name": cityName,
    "latitude": latitude,
    "longitude": longitude,
    "zip_code": zipCode,
    "time_zone": timeZone,
    "asn": asn,
    "as": ipGeolocationAs,
    "is_proxy": isProxy,
  };
}
