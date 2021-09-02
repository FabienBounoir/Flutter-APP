import 'package:flutter/material.dart';
import 'package:epicture/NiceText.dart';
import 'package:epicture/ContentWidget.dart';
import 'LoginPage.dart';
import 'Connected.dart';

void main() {
  runApp(MyApp());
  Connected(
      "d4b4b4af033710d2d423568a64b084df8851018a",
      "950f1271de45aa8e821ed8bea24fc4546c28207e",
      "badbouns",
      "146548119",
      "315360000");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(Uri.base);
    return MaterialApp(
      title: 'Epicture',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 122, 196),
      ),
      home: MyHomePage(title: 'Epicture'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  bool connecter = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: connecter ? ContentWidget(_selectedIndex) : (LoginPage()),
        bottomNavigationBar: connecter
            ? BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('Home')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), title: Text('Search')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.camera_alt), title: Text('Camera')),
                ],
                currentIndex: _selectedIndex,
                // selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
              )
            : (null));
  }
}

// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             Image.network('https://picsum.photos/250?image=9'),
//             Image.network('https://picsum.photos/250?image=9'),
//           ],
//         ),
//       )

//bottom bar
// ,
//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_box_rounded),
//               label: 'Account',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           // selectedItemColor: Colors.amber[800],
//           onTap: _onItemTapped,
//         )
