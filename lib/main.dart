import 'package:authapp/core/providers/auth.dart';
import 'package:authapp/core/routes/homepage.dart';
import 'package:authapp/core/routes/login.dart';
import 'package:authapp/core/routes/mainpage.dart';
import 'package:authapp/core/routes/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context,orientation,screenType) {
        return MultiProvider(
          providers: [
            ListenableProvider(create:(_) =>AuthProvider())
          ],
          child: MaterialApp(
            initialRoute: SplashScreenRoute.routeName,
              routes: {
                SplashScreenRoute.routeName:(context)=>const SplashScreenRoute(),
                MainPageRoute.routeName:(context)=> const MainPageRoute(),
                LoginPageRoute.routeName:(context)=> const LoginPageRoute(),
                HomePageRoute.routeName:(context)=>const HomePageRoute()
              },
          ),
        );
      }
    );
  }
}

