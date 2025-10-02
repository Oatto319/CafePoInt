import 'package:flutter/foundation.dart';

class PointsProvider extends ChangeNotifier {
  int _currentPoints = 0;
  
  int get currentPoints => _currentPoints;
  
  // เพิ่มแต้ม
  void addPoints(int points) {
    _currentPoints += points;
    notifyListeners();
  }
  
  // ลดแต้ม (ใช้ตอนแลกของรางวัล)
  void subtractPoints(int points) {
    if (_currentPoints >= points) {
      _currentPoints -= points;
      notifyListeners();
    }
  }
  
  // ตั้งค่าแต้ม
  void setPoints(int points) {
    _currentPoints = points;
    notifyListeners();
  }
  
  // เช็คว่ามีแต้มพอหรือไม่
  bool hasEnoughPoints(int required) {
    return _currentPoints >= required;
  }
}