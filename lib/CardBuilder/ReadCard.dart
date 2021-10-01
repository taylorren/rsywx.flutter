import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReadCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReadCardState();
}

class _ReadCardState extends State<ReadCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.glasses,
              color: Colors.amber,
              size: 50,
            ),
            title: Text('读书'),
            subtitle: Text('截止2021年10月01日，共有读书笔记150篇。单击此处浏览全部。'),
          )
        ],
      ),
    );
  }
}
