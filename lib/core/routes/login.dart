import 'package:authapp/core/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageRoute extends StatefulWidget {
  static const routeName = "/login";
  const LoginPageRoute({Key? key}) : super(key: key);

  @override
  State<LoginPageRoute> createState() => _LoginPageRouteState();
}

class _LoginPageRouteState extends State<LoginPageRoute> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,state,child) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            padding:  const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if(state.authState == AuthState.error)
                      const Text("Incorrect username or password. Please try again",style: TextStyle(color: Colors.black),),
                    const SizedBox(height: 60,),
                    TextFormField(
                       controller: _email,
                      validator: (text){
                         if(text==null || text.isEmpty)return "Please enter Email to continue";
                      },
                      decoration: InputDecoration(
                        labelText:"Email",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 0.5,color: Colors.green)
                        ),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 0.5)
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,),
                    TextFormField(
                      validator: (text){
                        if(text==null || text.isEmpty)return "Please enter password to continue";
                      },
                      obscureText: true,
                       controller: _password,
                      decoration: InputDecoration(
                        labelText:"Password",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 0.5,color: Colors.green)
                        ),
                        enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 0.5)
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: (){
                          submit(state);
                        }, child: const Text("Sign In"))

                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
  void submit(AuthProvider auth)async{
    if(_formKey.currentState!.validate()){
      await auth.login(_email.text,_password.text);
    }
  }
}
