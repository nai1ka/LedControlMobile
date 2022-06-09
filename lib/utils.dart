import 'package:http/http.dart' as http;


class Utils  {
  static final Utils _singleton = Utils._internal();

  factory Utils() {
    return _singleton;
  }
  static void openSite(String site) {
    var url = Uri.parse("http://192.168.0.13/" + site);
    http.get(url);
  }
  Utils._internal();
}