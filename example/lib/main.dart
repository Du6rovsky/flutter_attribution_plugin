import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_attribution_plugin/flutter_attribution_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String value = "Loading...";

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    try {
      if (Platform.isIOS) {
        value =
        await AttributionPlugin.getIosAttributionToken();
      } else {
        value =
        await AttributionPlugin.getAndroidReferrerUrl();
      }
    } catch (e) {
      value = e.toString();
    }

    debugPrint(value);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(value),
        ),
      ),
    );
  }
}