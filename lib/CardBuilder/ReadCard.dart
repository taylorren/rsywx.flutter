import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../DataProvider/provider.dart';

class ReadCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReadCardState();
}

class _ReadCardState extends State<ReadCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: getRead(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            var res = snapshot.data;
            var hc = res?['hc'] ?? 'n/a';
            var rc = res?['rc'] ?? 'n/a';

            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.glasses,
                      color: Colors.amber,
                      size: 50,
                    ),
                    title: Text('读书'),
                    subtitle: Text('当前，评论了$hc本书籍，撰写了$rc篇书评。'),
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
