import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:player_info/widgets/custompassfeild.dart';
import 'package:player_info/widgets/customsnacbar.dart';
import 'package:player_info/widgets/custonnamefeild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameContoller = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("Registration"),
        centerTitle:true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           CustonNameFeild.customNameFeild(_nameContoller),
            SizedBox(
              height:30,
            ),
          CustomPassFeild(passwordController: _passwordController,),
           SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
              onPressed: (){
                if(_nameContoller.text.trim().isNotEmpty && _passwordController.text.trim().isNotEmpty){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _nameContoller.text, password:_passwordController.text);
                    Navigator.pop(context);
                }else{

                 CustomSnacBar.snackbar(context);
                }
              },
             child: Text("Sign up",style: TextStyle(color: Colors.white),)),

              SizedBox(
              height: 20,
            ),

          
        ],
      ),
    );
  }
}