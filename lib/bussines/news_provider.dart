import 'dart:convert';
import 'dart:io';

import 'package:course_task/data/model/news_model.dart';
import 'package:course_task/data/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class NewsProvider extends ChangeNotifier {
  static NewsProvider get(context) => Provider.of(context, listen: false);
  NewsProvider() {
    fetchNews();
  }
  late NewsModel _newsObject;
  NewsModel get newsObject => _newsObject;
  bool _fetchingNews = false;

  bool get fetchingNews => _fetchingNews;

  fetchNews() async {
    _fetchingNews = true;
    try {
      await HttpHelper.newsMethod();
      if (HttpHelper.newsMessage.statusCode == 200) {
        _fetchingNews = false;
        String data = HttpHelper.newsMessage.body;
        _newsObject = NewsModel.fromJson(json.decode(data));
      }
    } catch (e) {
      if (e is SocketException) {
        toast("No Internet Connection");
      } else {
        toast(e.toString());
      }
    }
    notifyListeners();
  }

  void toast(String text) => Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
