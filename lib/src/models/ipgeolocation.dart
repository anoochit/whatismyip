// To parse this JSON data, do
//
//     final ipGeolocation = ipGeolocationFromJson(jsonString);

import 'dart:convert';

IpGeolocation ipGeolocationFromJson(String str) =>
    IpGeolocation.fromJson(json.decode(str));

String ipGeolocationToJson(IpGeolocation data) => json.encode(data.toJson());

class IpGeolocation {
  final String? ip;
  final String? countryCode;
  final String? countryName;
  final String? regionName;
  final String? cityName;
  final double? latitude;
  final double? longitude;
  final String? zipCode;
  final String? timeZone;
  final String? asn;
  final String? ipGeolocationAs;
  final bool? isProxy;

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
