import 'package:flutter/material.dart';
import 'package:player_info/view/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar:AppBar(
        actions: [
          IconButton(onPressed: ()async{
            SharedPreferences sharedPreferences =await  SharedPreferences.getInstance();
            sharedPreferences.setBool('login', false);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
              return LoginScreen();
            },));
          },
           icon: Icon(Icons.logout))
        ],
        title:  const Text("Home Screen"),
      centerTitle: true,
      ),
      body: Column(
        children: [
          
        ],
      ),
    floatingActionButton: FloatingActionButton(onPressed: () {
      
    },
    
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}