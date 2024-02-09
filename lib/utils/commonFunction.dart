import 'package:shared_preferences/shared_preferences.dart';

class Helper {
static var valueSharedPreferences = '';

// Write DATA
static Future<bool> setCount(value) async {
	SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
	return await sharedPreferences.setInt('count', value);
}

// Read Data
   
}
