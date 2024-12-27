import 'package:flutter/material.dart';
import 'package:player_info/widgets/custonnamefeild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text("Login"),
        centerTitle: true,

      ),
      body: Padding(
        padding: EdgeInsets.only(left: 40,right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustonNameFeild.customNameFeild(),
            SizedBox(
              height: 10,
            ),
             CustonNameFeild.customNameFeild(),
          ],
        ),
      ),
    );
  }
}