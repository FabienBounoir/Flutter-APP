import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  var _pictures = [];
  List arrayRecherche = [];
  int statusSearch = 0;
  bool etat = false;

  final myController = TextEditingController();

  String clientId = "817c9afd3f7a826";
  String bearerToken = "a7c5407135610fd6ee7da764fcea6c795ebddd6b";
  String clientSecret = "016a2267088f4c786f7bcd3d77083890acc7b712";
  String refreshToken = "c90586fffad99b26edda1f602e3c5b1777839f90";
  String accountUsername = "badbouns";
  // Profil();

  @override
  void initState() {
    super.initState();
    SearchPage();
  }

  Future<Null> SearchPage() async {
    print("Search");

    var queryParameters = {
      'q': myController.text,
    };

    var response = await http.get(
      Uri.https(
          "api.imgur.com", "/3/gallery/search/viral/all/0", queryParameters),
      headers: {"Authorization": "Client-ID 817c9afd3f7a826"},
    );
    // if (response.statusCode != 200) {
    //   return;
    // }
    var data = jsonDecode(response.body);
    print(data["data"]);
    // print(data["data"]["success"]);

    setState(() {
      etat = true;
      // status = data["data"]["status"];
      statusSearch = data["status"];
      arrayRecherche = data["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            color: Color.fromRGBO(229, 229, 234, 100),
            child: TextField(
              style: TextStyle(color: Colors.green),
              cursorColor: Colors.red,
              controller: myController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          )),
    ));

    children.add(ElevatedButton(
        onPressed: () async {
          SearchPage();
        },
        child: Text("Search")));

    if (statusSearch == 200) {
      for (var search in arrayRecherche) {
        if (search["images"] != null) {
          children.add(Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 199, 199, 204),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                search["images"][0]["link"],
                                semanticLabel: search["images"][0]["id"],
                              ))),
                      (search["images"][0]["description"] != null)
                          ? (Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(search["images"][0]["description"],
                                  style: TextStyle(fontSize: 15)),
                            ))
                          : (Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(search["title"],
                                  style: TextStyle(fontSize: 15)),
                            )),
                    ]),
                  ))));
        } else {
          children.add(Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 199, 199, 204),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                search["link"],
                                // semanticLabel: search["images"][0]["id"],
                              ))),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(search["title"],
                            style: TextStyle(fontSize: 15)),
                      ),
                    ]),
                  ))));
        }
      }
      // children.add(Text("coucou"));
    }
    //i = 0; i < arrayRecherche[0].length; i++

    return Container(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children),
    ));
  }
}

// SearchPage() {
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//     child: ClipRRect(
//         borderRadius: BorderRadius.circular(25.0),
//         child: Container(
//           color: Color.fromRGBO(229, 229, 234, 100),
//           child: TextField(
//             style: TextStyle(color: Colors.green),
//             cursorColor: Colors.red,
//             decoration: InputDecoration(
//               prefixIcon: Icon(
//                 Icons.search,
//                 color: Colors.black,
//               ),
//               hintText: 'Search...',
//               hintStyle: TextStyle(color: Colors.black),
//             ),
//           ),
//         )),
//   );
// }
