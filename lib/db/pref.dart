import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static void saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
  }

  static void saveAge(double age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('age', age);
  }

  static void saveLikeSport(bool likeSport) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('sport', likeSport);
  }

  static Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
    // String? name= prefs.getString('name');
    // return name;  >> return ini untuk kasus apabila return nya mau di custom nilainya kalau cuma satu bisa langsung pake cara diatas dirubah satu2
  }

  static Future<double?> getAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('age');
  }

  static Future<bool?> getLikeSport() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('sport');
  }
}
