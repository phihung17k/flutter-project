
import 'dart:async';

class LoginBloc {

  StreamController _controller = new StreamController.broadcast();
  // StreamController _passController = new StreamController();
  // StreamController _loginController = new StreamController();

  Stream get stream => _controller.stream.asBroadcastStream();
  // Stream get passStream => _passController.stream;
  // Stream get loginStream => _loginController.stream;

  bool checkValidUser(String user){
    String pattern = r"^[a-zA-Z]\w+\@\w+\.\w+(\.\w+)?$";
    if(!RegExp(pattern).hasMatch(user)){
      _controller.sink.add("email");
      return false;
    }
    removeData();
    return true;
  }

  bool checkValidPass(String pass){
    if(pass.trim().isEmpty){
      _controller.sink.add("pass");
      return false;
    }
    removeData();
    return true;
  }

  void removeData(){
    _controller.sink.add(null);
  }

  // bool checkValidUserAndPass(String user, String pass){
  //   if(checkValidUser(user) && checkValidPass(pass)){
  //     return true;
  //   }
  //   _loginController.sink.addError("")
  //   return false;
  // }
  
  bool checkLogin(String user, String pass){
    if( "ab@c.d".endsWith(user) && "1".endsWith(pass)){
      removeData();
      return true;
    }else{
      _controller.sink.addError("Login fail");
      return false;
    }
  }

  void dispose(){
    this._controller.close();
  }
}