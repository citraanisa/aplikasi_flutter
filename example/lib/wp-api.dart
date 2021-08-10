import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPosts() async {
  final String apiEndpoint =
      'https://smkn2banjar-jabar.sch.id/wp-json/wp/v2/posts';
  final Uri url = Uri.parse(apiEndpoint);
  final response = await http.get(url);

  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}

Future<List> fetchWpPostImageUrl(href) async {
  final response =
      await http.get(href, headers: {"Accept": "application/json"});

  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}
