import 'package:flutter/material.dart';
import 'package:authapp/core/repo/auth.dart' as authRepo;

import '../models/user.dart';
enum AuthState{
  loggedOut,
  loggedIn,
  loading,
  error
}

class AuthProvider with ChangeNotifier{
  AuthState _authState = AuthState.loading;
  UserModel? _user;
  AuthState get authState => _authState;
  UserModel? get user => _user;

  AuthProvider(){
    isLoggedIn();
  }

  void isLoggedIn(){
    _authState = AuthState.loggedOut;
    notifyListeners();
  }
  Future<void> login(String email,String password)async{
      try{
        _user= await authRepo.login(email, password);
        _authState = AuthState.loggedIn;
      }catch(e){
        _authState = AuthState.error;
      }
      notifyListeners();
  }
  void logout(){
    _user = null;
    _authState = AuthState.loggedOut;
    notifyListeners();
  }
}