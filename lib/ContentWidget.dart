import 'package:flutter/material.dart';
import 'dart:math';
import 'Profil.dart';
import 'Search.dart';
import 'package:epicture/NiceText.dart';

class ContentWidget extends StatelessWidget {
  final int page;

  ContentWidget(this.page);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    Future<Null> refreshList() async {
      await Future.delayed(Duration(seconds: 10));
      print("refresh");
      return null;
    }

    GlobalKey<RefreshIndicatorState> refreshKey;

    switch (page) {
      case 0:
        {
          children.add(Profil());
        }
        break;

      case 1:
        {
          children.add(SearchPage());
        }
        break;

      case 2:
        {
          children.add(Center(child: Text("upload Page")));
        }
        break;

      default:
        {
          children.add(Text("default"));
        }
        break;
    }

    // if (page == 0) {
    // } else {
    //   children.add(
    //     LoginPage(),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: NiceText("Epicture")),
      ),
      body: ListView(children: children),
    );
  }
}
