import 'package:flutter/material.dart';
import 'package:player_info/view/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

   late  AnimationController  animationController;
   late Animation<Offset> positionAnimation;
   late Animation<double> opacityAnimation;
    @override
    void initState() {
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 5));
    animationController.forward();
      opacityAnimation= Tween<double>(begin:0.0,end: 0.8).animate(CurvedAnimation(parent: animationController, curve:Curves.easeInCirc));
    
  positionAnimation = Tween<Offset>(begin: Offset(1.0,0 ),end: Offset.zero).animate(CurvedAnimation(parent: animationController, curve:Curves.easeInOut));
animationController.forward();
    


    super.initState();
  }
   void registerScreen() {
    Future.delayed(Duration(seconds: 7),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return LoginScreen();
      },)); 
    });
   }
  @override
  Widget build(BuildContext context) {
    registerScreen();
    return  Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child:AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
           return  SlideTransition(
            position: positionAnimation,
             child: FadeTransition(
              opacity: opacityAnimation,
               child: Container(
                height: 100,
                width: 100,
                         
                alignment: Alignment.center,
                decoration: BoxDecoration(
                         color: Colors.white,
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child: Text("Player Info"),
                         ),
             ),
           );
          },
       
        )
      ),
    );
  }
  
 
}