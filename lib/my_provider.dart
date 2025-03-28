import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String? _myPlatform;
  String? _myUrl;

  void setMyPlatform(value) {
    _myPlatform = value;
    notifyListeners();
  }

  void setMyUrl(value) {
    _myUrl = value;
    notifyListeners();
  }

  String getMyPlatform() => _myPlatform ?? 'whatsapp.png';

  String getMyUrl() => _myUrl ?? 'https://wa.me/+201145037756';

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
