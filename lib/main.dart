import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CardBuilder/ReadCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '任氏有无轩',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '任氏有无轩 | 全平台版'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          buildBookCard(),
          ReadCard(),
          buildBlogCard(),
          buildWikiCard(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Card buildWikiCard() {
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
          onTap: () => _launch(uri),
        )
      ],
    ));
  }

  Card buildBookCard() {
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
            subtitle: Text('截止2021年08月13日，共藏书1150册。单击此处浏览全部。'),
          )
        ],
      ),
    );
  }

  Card buildBlogCard() {
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
            onTap: () => _launch(uri),
          )
        ],
      ),
    );
  }

  void _launch(String url) async {
    await launch(url);
  }
}
