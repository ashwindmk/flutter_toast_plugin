
import 'dart:async';

import 'package:flutter/services.dart';

class ToastPlugin {
  static const MethodChannel _channel = const MethodChannel('toast_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static showToast(String message) {
    _channel.invokeMethod("showToast", {"message": message});
  }
}
