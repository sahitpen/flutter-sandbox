import 'dart:convert';

import 'package:flutter/services.dart';

class SecretLoader {
  static Future<String> getStocksApiKey() {
    return rootBundle.loadStructuredData('secrets.json', (keyJson) async {
      return jsonDecode(keyJson)['stocks_api_key'];
    });
  }
}
