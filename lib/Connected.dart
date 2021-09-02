import 'package:shared_preferences/shared_preferences.dart';

class Connected {
  Connected(var accessToken, var refreshToken, var accountUsername,
      var accountId, var expire) {
    print("on add cookie");
    addCookie(accessToken, refreshToken, accountUsername, accountId, expire);
  }

  Future<void> addCookie(
      accessToken, refreshToken, accountUsername, accountId, expire) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', accessToken);
    prefs.setString('refresh_token', refreshToken);
    prefs.setString('account_username', accountUsername);
    prefs.setString('account_id', accountId);
    prefs.setInt(
        'expires', DateTime.now().millisecondsSinceEpoch + int.parse(expire));
  }
}
