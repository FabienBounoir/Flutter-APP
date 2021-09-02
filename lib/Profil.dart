import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:epicture/NiceText.dart';
import 'package:http/http.dart' as http;

class Profil extends StatefulWidget {
  @override
  ProfilState createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  var _pictures = [];
  var linkAvatar = "";
  var bio = "";
  int reputation = 0;
  var reputationName = "bg";
  List arrayImageProfils = [];
  int status = 0;

  String clientId = "817c9afd3f7a826";
  String bearerToken = "a7c5407135610fd6ee7da764fcea6c795ebddd6b";
  String clientSecret = "016a2267088f4c786f7bcd3d77083890acc7b712";
  String refreshToken = "c90586fffad99b26edda1f602e3c5b1777839f90";
  String accountUsername = "badbouns";
  // Profil();

  @override
  void initState() {
    super.initState();
    getPictures();
    getImages();
  }

  Future<Null> getPictures() async {
    var response = await http.get(
      Uri.https("api.imgur.com", "/3/account/badbouns"),
      headers: {"Authorization": "Client-ID 817c9afd3f7a826"},
    );
    // if (response.statusCode != 200) {
    //   return;
    // }
    var data = jsonDecode(response.body);
    // List pictures = data["data"];
    if (data["status"] == 200) {
      setState(() {
        status = data["status"];
        linkAvatar = data["data"]["avatar"];
        bio = data["data"]["bio"];
        reputation = data["data"]["reputation"];
        reputationName = data["data"]["reputation_name"];
      });
      // print(data);
      print(linkAvatar);
      print(bio);
      print(reputation);
      print(reputationName);
    } else {
      status = data["status"];
    }
  }

  Future<Null> getImages() async {
    var response = await http.get(
      Uri.https("api.imgur.com", "/3/account/me/images"),
      headers: {"Authorization": "Bearer $bearerToken"},
    );
    // if (response.statusCode != 200) {
    //   return;
    // }
    var data = jsonDecode(response.body);
    // List pictures = data["data"];
    // print(data);
    setState(() {
      arrayImageProfils = data["data"];
    });

    print(arrayImageProfils);
  }

  // Future<Null> getImagee() async {
  //   var response = await http.get(
  //     Uri.https("api.imgur.com", "/3/account/me/images"),
  //     headers: {HttpHeaders.authorizationHeader: "Bearer $bearerToken"},
  //   );
  //   if (response.statusCode != 200) {
  //     return;
  //   }
  //   var data = jsonDecode(response.body);
  //   List pictures = data["data"];
  //   var responseAlbums = await http.get(
  //     Uri.https("api.imgur.com", "/3/account/me/albums/0"),
  //     headers: {HttpHeaders.authorizationHeader: "Bearer $bearerToken"},
  //   );
  //   if (responseAlbums.statusCode != 200) {
  //     return;
  //   }
  //   var albumData = jsonDecode(responseAlbums.body)['data'];
  //   for (var album in albumData) {
  //     var res = await http.get(
  //       Uri.https("api.imgur.com", "/3/account/me/album/${album['id']}"),
  //       headers: {HttpHeaders.authorizationHeader: "Bearer $bearerToken"},
  //     );
  //     var albumRes = await jsonDecode(res.body)['data'];
  //     if (albumRes['images'] == null) continue;
  //     for (var imageAlbum in albumRes['images']) {
  //       pictures.removeWhere((element) => (element['id'] == imageAlbum['id']));
  //     }
  //     pictures.add(albumRes);
  //   }
  //   pictures.sort((a, b) => b['datetime'].compareTo(a['datetime']));
  //   setState(() {
  //     _pictures = pictures;
  //   });
  //   print("les picture modifier:");
  //   print(_pictures);
  // }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (status == 200) {
      children.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
          child: Text("badbouns", style: TextStyle(fontSize: 30))));

      children.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: new Container(
                  width: 190.0,
                  height: 190.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(linkAvatar)))))));

      children.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text("$reputation ㆍ $reputationName",
              style: TextStyle(fontSize: 25))));

      if (bio != null) {
        children.add(Center(
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Text(bio,
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic))),
        ));
      }

      for (var i = 0; i < arrayImageProfils.length; i++) {
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
                              arrayImageProfils[i]["link"],
                              semanticLabel: "coucou",
                            ))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(arrayImageProfils[i]["description"],
                          style: TextStyle(fontSize: 15)),
                    ),
                  ]),
                ))));
      }
    } else {
      children.add(Center(
        child:
            Text("erreur", style: TextStyle(fontSize: 30, color: Colors.red)),
      ));
    }

    // children.add(RefreshIndicator(
    //   color: Colors.green,
    //   onRefresh: getPictures,
    //   child: CustomScrollView(
    //     scrollDirection: Axis.vertical,
    //     slivers: <Widget>[Text("coucou")],
    //   ),
    // ));

    // children.add(GridView.count(
    //   crossAxisCount: 4,
    //   // Generate 100 widgets that display their index in the List.
    //   children: List.generate(4, (index) {
    //     return Center(
    //       child: Text(
    //         'Item $index',
    //         style: Theme.of(context).textTheme.headline5,
    //       ),
    //     );
    //   }),
    // ));

    return Container(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children),
    ));
  }
}
