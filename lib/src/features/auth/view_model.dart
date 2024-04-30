import 'package:flutter/foundation.dart';
import 'package:flutter_pocketbase_1/src/features/auth/domain.dart';
import 'package:flutter_pocketbase_1/src/features/auth/pocketbase_data_source.dart';

class AuthViewModel with ChangeNotifier {
  final AuthPocketbaseDataSource dataSource;
  var user = User(username: "", id: "");

  AuthViewModel({required this.dataSource});

  Future<void> signIn(String username, String password) async {
    user = await dataSource.signIn(username, password);
    notifyListeners();
  }

  Future<void> signUp(String username, String password) async {
    user = await dataSource.signUp(username, password);
    notifyListeners();
  }
}
