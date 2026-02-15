
import 'package:get_storage/get_storage.dart';
class Localstorage {
  ///write
  void saveLanguageTodisk (String language) async{
   await GetStorage().write('Lang', language);
  }
  ///read
  Future <String> get languageSelected async{
    return await GetStorage().read('Lang');
  }
}