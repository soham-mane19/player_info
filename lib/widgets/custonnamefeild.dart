
import 'package:flutter/material.dart';

class CustonNameFeild {

static Widget customNameFeild(TextEditingController controller){
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
      hintText: 'Enter your email',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black)),
      ),
    );


}




}