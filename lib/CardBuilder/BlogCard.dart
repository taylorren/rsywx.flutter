import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReadCardState();
}

class _ReadCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    const uri = 'https://blog.rsywx.net';
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.pen,
              size: 50,
              color: Colors.cyan,
            ),
            title: Text('博客'),
            subtitle: Text('浏览所有'),
            onTap: () => launch(uri),
          )
        ],
      ),
    );
  }
}
