import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WikiCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WikiCard();
}

class _WikiCard extends State<WikiCard> {
  @override
  Widget build(BuildContext context) {
    const uri = 'http://rsywx.com';
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.cookieBite,
            size: 50,
            color: Colors.pinkAccent,
          ),
          title: Text('维客'),
          subtitle: Text('任氏有无轩维客成立于2018年。是所有大型项目的存档处。'),
          onTap: () => launch(uri),
        )
      ],
    ));
  }
}
