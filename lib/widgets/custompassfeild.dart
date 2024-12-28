
import 'package:flutter/material.dart';

class CustomPassFeild extends StatefulWidget {
 
 final TextEditingController passwordController;
CustomPassFeild({super.key,required this.passwordController});


@override
State createState() => _CustomPassFeildState();


}

  class _CustomPassFeildState extends State<CustomPassFeild>{
  bool showpassword = false;
@override
Widget build(BuildContext context){
  
  return TextFormField(
    controller: widget.passwordController,
      obscureText: !showpassword,
      decoration: InputDecoration(
        hintText: 'Enter password',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black)
       ),
        suffixIcon: IconButton(onPressed: (){
           showpassword = !showpassword;
           setState(() {});
        }, icon: Icon(showpassword ? Icons.visibility:Icons.visibility_off),

        ),
        
      )
     
    );
}

  }


