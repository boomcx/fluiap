import 'dart:async';

import 'package:flutter/services.dart';

class Fluiap {
  static const MethodChannel _channel =
      const MethodChannel('com.xzkj/fluiap');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  static Future purchase(String id) async {
    Map args = {
      'id': id,
    };
    final Map res = await _channel.invokeMethod('purchase', args);
    return res;
  }
}
