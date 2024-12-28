import 'package:flutter/material.dart';

class CustomSnacBar {

 static void snackbar(BuildContext context){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fill all the feilds')));
}



}