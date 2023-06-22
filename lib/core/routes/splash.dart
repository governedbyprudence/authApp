import 'package:authapp/core/routes/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreenRoute extends StatefulWidget {
  static const routeName = "/";
  const SplashScreenRoute({Key? key}) : super(key: key);

  @override
  State<SplashScreenRoute> createState() => _SplashScreenRouteState();
}
// Flutter lifecycle methods
class _SplashScreenRouteState extends State<SplashScreenRoute> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, MainPageRoute.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: const Icon(Icons.account_tree_rounded,size: 60,)
      ),
    );
  }
}
