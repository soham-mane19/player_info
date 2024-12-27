
import 'package:flutter/material.dart';

class CustonNameFeild {
  
static Widget customNameFeild(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black)),
      ),
    );


}




}