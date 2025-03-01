import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whatismyip/whatismyip.dart';

const apiKey = String.fromEnvironment('IP2LOCATION_API', defaultValue: '');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Find My IP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: Text(result)),
            ElevatedButton(
              onPressed: () => _findMyIp(context),
              child: Text('Find My IP'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _findMyIp(BuildContext context) async {
    try {
      final ip = await WhatIsMyIp().getIpGeolocation(apiKey: apiKey);
      setState(() {
        result = jsonEncode(ip.toJson());
      });
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }
}
