import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../DataProvider/provider.dart';

class BookCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: getBook(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            var res = snapshot.data;
            var bc = res?['bc'] ?? 'n/a';
            var wc = res?['wc'] ?? 'n/a';
            var pc = res?['pc'] ?? 'n/a';
            var vc = res?['vc'] ?? 'n/a';

            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.book,
                      color: Colors.blue,
                      size: 50,
                    ),
                    title: Text('藏书'),
                    subtitle: Text('当前，任氏有无轩收藏了$bc本书籍，约$wc千字，$pc页。浏览总量$vc次。'),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            );
          }
        });
  }
}
