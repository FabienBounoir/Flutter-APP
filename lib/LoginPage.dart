import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './StyleText/Titre.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Connected.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, @required this.parent}) : super(key: key);
  final parent;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String urlConnexion =
      'https://api.imgur.com/oauth2/authorize?client_id=3ac22aa91d98294&response_type=token&state=login_token';
  String urlRegister = 'https://imgur.com/register';
  StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    initLinks();
  }

  @override
  void dispose() {
    super.dispose();
    if (_sub != null) _sub.cancel();
  }

  void initLinks() async {
    await initUniLinks();
  }

  Future<void> getLink(String url) async {
    print("connexion OK ");
    url = url.replaceFirst('#', '&');
    Uri uri = Uri.parse(url);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', uri.queryParameters['access_token']);
    prefs.setString('refresh_token', uri.queryParameters['refresh_token']);
    prefs.setString(
        'account_username', uri.queryParameters['account_username']);
    prefs.setString('account_id', uri.queryParameters['account_id']);
    prefs.setInt(
        'expires',
        DateTime.now().millisecondsSinceEpoch +
            int.parse(uri.queryParameters['expires_in']));
    widget.parent.setState(() {
      widget.parent.findPrefs();
    });
  }

  /// Initialise DeepLinking listener
  Future<Null> initUniLinks() async {
    try {
      String initialLink = await getInitialLink();
      if (initialLink != null) {
        await getLink(initialLink);
      }
    } on PlatformException {
      return;
    }
    _sub = getLinksStream().listen((String link) async {
      await getLink(link);
    }, onError: (err) {
      print(err);
    });
  }

  Future<void> addCookie() async {
    Connected(
        "d4b4b4af033710d2d423568a64b084df8851018a",
        "950f1271de45aa8e821ed8bea24fc4546c28207e",
        "badbouns",
        "146548119",
        "315360000");

    print("click effectuer");

    final prefs = await SharedPreferences.getInstance();
    final access_token = prefs.getString('access_token');
    final refresh_token = prefs.getString('refresh_token');
    final name = prefs.getString('account_username');
    final account_id = prefs.getString('account_id');
    final expires = prefs.getString('expires');
    print(access_token.toString());
    print(refresh_token.toString());
    print(name.toString());
    print(account_id.toString());
    print(expires.toString());
  }

  /// Displays a button to login
  /// Redirects to imgur site for user to login
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Titre("Epicture"),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 70, 0, 70),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      "https://media.discordapp.net/attachments/643948072141062194/818879424459178045/Epicture.png",
                      height: 150,
                      width: 150,
                    ))),
            ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: OutlinedButton(
                    onPressed: () async {
                      launch(urlConnexion);
                    },
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                        child: Text('Login on Imgur !',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white))),
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 52, 199, 89)))),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: OutlinedButton(
                      onPressed: () async {
                        launch(urlRegister);
                      },
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Text('Register on Imgur !',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white))),
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 122, 196)))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: OutlinedButton(
                      onPressed: () async {
                        addCookie();
                      },
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Text('Add Token to cookie',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white))),
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 216, 32, 32)))),
            )
          ]),
    ));
  }
}
