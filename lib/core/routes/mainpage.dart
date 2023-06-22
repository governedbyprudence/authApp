import 'package:authapp/core/providers/auth.dart';
import 'package:authapp/core/routes/homepage.dart';
import 'package:authapp/core/routes/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPageRoute extends StatefulWidget {
  static const routeName = "/main";
  const MainPageRoute({Key? key}) : super(key: key);

  @override
  State<MainPageRoute> createState() => _MainPageRouteState();
}

class _MainPageRouteState extends State<MainPageRoute> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context,state,child){
      try{
      if(state.authState == AuthState.loading){
        return Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      }
      if(state.authState== AuthState.loggedOut){
        return const LoginPageRoute();
      }
      if(state.authState == AuthState.loggedIn){
        return const HomePageRoute();
      }
      return const LoginPageRoute();
      }catch(e){
        return const LoginPageRoute();
      }
    });
  }
}
