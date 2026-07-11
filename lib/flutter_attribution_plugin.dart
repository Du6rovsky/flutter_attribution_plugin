import 'package:flutter/services.dart';

class AttributionPlugin {
  static const MethodChannel _channel =
  MethodChannel('flutter_attribution_plugin');

  static Future<String> getIosAttributionToken() async {
    return await _channel.invokeMethod<String>(
      'getIosAttributionToken',
    ) ?? '';
  }

  static Future<String> getAndroidReferrerUrl() async {
    return await _channel.invokeMethod<String>(
      'getAndroidReferrerUrl',
    ) ?? '';
  }
}