import 'package:shared_preferences/shared_preferences.dart';

class SaveMyData {
  static String memeKey = "MEMEKEY";

  static Future<bool> saveData(int val) async {
    final inst = await SharedPreferences.getInstance();
    return await inst.setInt(memeKey, val);
  }

  static Future<int> fetchData() async {
    final inst = await SharedPreferences.getInstance();
    // Return the saved value, or 0 if nothing is saved
    return inst.getInt(memeKey) ?? 0;
  }
}
