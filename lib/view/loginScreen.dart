import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:player_info/view/HomeScreen.dart';
import 'package:player_info/view/registerscreen.dart';
import 'package:player_info/widgets/custompassfeild.dart';
import 'package:player_info/widgets/custonnamefeild.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController _nameContoller = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
@override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
      title: Text("Login"),
      centerTitle: true),
      body: Padding(
      padding: EdgeInsets.only(left: 40,right: 40),
      child: Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
      CustonNameFeild.customNameFeild(_nameContoller),
            SizedBox(
              height:30,
            ),
          CustomPassFeild(passwordController: _passwordController),
           SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
              onPressed: ()async{
                   
                   if(_nameContoller.text.trim().isNotEmpty && _passwordController.text.trim().isNotEmpty){
                   try{
                    
             UserCredential userCredential =  await FirebaseAuth.instance.signInWithEmailAndPassword(email:_nameContoller.text, password: _passwordController.text);
             
             SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
             sharedPreferences.setBool('login', true);
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
               return Homescreen();
             },));
                   }on FirebaseAuthException catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.message}")));
                   }
                      
              }else{
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("fill all feilds")));

              }  
              },
             child: Text("Login",style: TextStyle(color: Colors.white),)),

              SizedBox(
              height: 20,
            ),

          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: 'Dont have account ? ',
                style: TextStyle(color: Colors.black)
              ),
               TextSpan(
                text: 'Sign up',
                style: TextStyle(fontSize: 16,color: Colors.blue),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  },));
                }
           
              ),
           
            ]
          ))
          ],
        ),
      ),
    );
  }
}