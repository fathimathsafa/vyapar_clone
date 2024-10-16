import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyapar_clone/core/models/credential_model.dart';

import '../../../core/constatnts/shared_preference_const.dart';




class SharedPreLocalStorage {

  static late SharedPreferences _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }


  static Future<void> setCredential(CredentialModel model) async {
    await _preferences.setString(SharedPreferenceConst.accessToken, model.token);
    await _preferences.setString(SharedPreferenceConst.phonNumber, model.phoneNo);
    await _preferences.setString(SharedPreferenceConst.userId, model.userId);
  }

  static Future<CredentialModel> getCredential() async {
    
   String? token=    _preferences.getString(SharedPreferenceConst.accessToken);
     String? phone= _preferences.getString(SharedPreferenceConst.phonNumber);
     String? userId= _preferences.getString(SharedPreferenceConst.userId);
     
    return CredentialModel(token: token??'', userId: userId??'', phoneNo: phone??'');
  }

  static Future<String> getToken()async{
      CredentialModel model = await getCredential();
    return model.token.toString();
  }


  static clear() async{
    await _preferences.clear();
  }
}
