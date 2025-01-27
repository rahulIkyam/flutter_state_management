import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class LoginProvider with ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  void login(String email, String password) async{
    setLoading(true);
    try{
      Response response = await post(
          Uri.parse("https://reqres.in/api/login"),
        body: {
            "email" : email,
          "password" : password
        }
      );
      if(response.statusCode == 200){
        setLoading(false);
        print("------- success ---------");
      }else{
        setLoading(false);
        print('----- failed ------');
      }
    }catch(e){
      setLoading(false);
      print(e.toString());
    }
  }
}