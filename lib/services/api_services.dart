import 'dart:convert';
import 'dart:math';

import 'package:news_app/model/newsmodel.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/services/utils/const.dart';

class ApiServices {
  Future<NewsModel> getApi() async {
    try {
      Uri url = Uri.parse(baseurl);
      final res = await http.get(url);
      Map data = jsonDecode(res.body);
      List articles = data['articles'];
      // print(data1);
      final random = Random();
      Map<String, dynamic> myarticle =
          articles[random.nextInt(articles.length)];
      // print(myarticle);
      return NewsModel.fromApitoApp(myarticle);
    } catch (e) {
      throw Exception('Exception Occured :- $e');
    }
  }
}
