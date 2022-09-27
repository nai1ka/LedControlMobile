import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static final Utils _singleton = Utils._internal();

  factory Utils() {
    return _singleton;
  }

  static void openSite(String site) async{
    var serverIP = await getServerIP();
    var url = Uri.parse("http://$serverIP/" + site);
    http.get(url);
    print(url);
  }

  static Future<String> getServerIP() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString("serverIP") ?? "");
    return prefs.getString("serverIP") ?? "";
  }

  Utils._internal();
}
