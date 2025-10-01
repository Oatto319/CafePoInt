import '../models/user_model.dart';

class AuthService {
  static UserModel? _currentUser;

  static UserModel? get currentUser => _currentUser;

  static Future<bool> login(String email, String password) async {
    // จำลองการ login
    await Future.delayed(const Duration(seconds: 1));
    
    _currentUser = UserModel(
      id: '1',
      name: 'Coffee Lover',
      email: email,
      profileImage: null,
      address: '123 Coffee Street',
      points: 0,
    );
    
    return true;
  }

  static void logout() {
    _currentUser = null;
  }

  static void updateUser(UserModel user) {
    _currentUser = user;
  }
}