import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReadCardState();
}

class _ReadCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.book,
              color: Colors.green,
              size: 50,
            ),
            title: Text('藏书'),
            subtitle: Text('截止2021年10月01日，共藏书1150册。单击此处浏览全部。'),
          )
        ],
      ),
    );
  }
}
