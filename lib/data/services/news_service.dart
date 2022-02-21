import 'package:course_task/data/model/news_model.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static dynamic newsMessage;
  static Future newsMethod() async {
    String apiKey = "pub_46702728d9ddcc22c7c61baee1d59988a33c";
    String country = "us";
    newsMessage = await http
        .get( Uri.parse('https://newsdata.io/api/1/news?apikey=$apiKey&country=$country'));
    return newsMessage;
  }
}
