
import 'package:shared_preferences/shared_preferences.dart';

class SavedInstructions {

  Future<bool> getShowInstructions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return (prefs.getBool('show_instruction') != null) ? prefs.getBool('show_instruction') : true;
  }

  setShowInstructions(bool boolean) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('show_instruction', boolean);
  }
    
}