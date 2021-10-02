import 'dart:convert';

import 'package:http/http.dart' as http;

const HTTP_OK = 200;

Future<Map<String, dynamic>> getReading() async {
  const uri = 'https://api.rsywx.com/read';
  final response = await http.get(Uri.parse(uri));

  if (response.statusCode == HTTP_OK) {
    var res = jsonDecode(response.body);
    //var hc = res.data;
    return res['data'];
  } else {
    throw Exception('Failed to load Reading summary data.');
  }
}
