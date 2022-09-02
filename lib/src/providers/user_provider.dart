import 'package:ichat/src/models/user.dart';
import 'package:ichat/src/providers/provider.dart';

class UserProvider extends BaseProvider {
  User? _user;
  User? get user => _user;

  void setUser(User? value) {
    _user = value;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }

  bool get isLoggedIn => _user != null;
}
