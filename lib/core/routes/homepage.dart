import 'package:authapp/core/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageRoute extends StatefulWidget {
  static const routeName = "/home";
  const HomePageRoute({Key? key}) : super(key: key);

  @override
  State<HomePageRoute> createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,state,child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){
                state.logout();
              }, icon: const Icon(Icons.logout))
            ],
          ),
          body: Container(
            alignment: Alignment.center,
            child: const Text("HomePage"),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   items: const [
          //     BottomNavigationBarItem(icon: Icon(Icons.home)),
          //     BottomNavigationBarItem(icon: Icon(Icons.person)),
          //   ],
          // ),
        );
      }
    );
  }
}
