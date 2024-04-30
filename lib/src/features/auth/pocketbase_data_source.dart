import 'package:flutter_pocketbase_1/src/features/auth/domain.dart';
import 'package:pocketbase/pocketbase.dart';

class AuthPocketbaseDataSource {
  final PocketBase pb;

  AuthPocketbaseDataSource({required this.pb});

  Future<User> signIn(String username, String password) async {
    final authRecord =
        await pb.collection('users').authWithPassword(username, password);
    final user = User(
        id: authRecord.record!.id,
        username: authRecord.record?.data["username"]);
    return user;
  }

  Future<User> signUp(String username, String password) async {
    final Map<String, dynamic> body = {
      "username": username,
      "password": password,
      "passwordConfirm": password
    };
    final userRecord = await pb.collection('users').create(body: body);
    await pb.collection('users').authWithPassword(username, password);
    final user = User(id: userRecord.id, username: userRecord.data["username"]);
    return user;
  }
}
