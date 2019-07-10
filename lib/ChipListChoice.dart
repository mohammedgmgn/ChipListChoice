import 'dart:async';

import 'package:flutter/services.dart';

class ChipListChoice {
  static const MethodChannel _channel =
      const MethodChannel('chip_list_choice');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
