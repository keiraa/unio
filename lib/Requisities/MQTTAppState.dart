

import 'package:flutter/cupertino.dart';

enum MQTTMessageState { on, off }

class MQTTAppState with ChangeNotifier{
  MQTTMessageState _messageState = MQTTMessageState.off;
  bool _isOn = false;
  void setOn(bool s){
    _isOn = s;
    notifyListeners();
  }
  bool get getIsOn => _isOn;
}