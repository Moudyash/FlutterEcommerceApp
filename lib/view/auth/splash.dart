import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   Future.delayed(Duration(seconds: 3), () {
     if(FirebaseAuth.instance.currentUser==null){
       Navigator.of(context).pushNamed("/login");
     }else{
       Navigator.of(context).pushNamed("/home");
     }   });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: const[
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child:  Center(child: Text("Shopping",style: TextStyle(fontSize: 74,color: Colors.blue,fontFamily: "Organical")),)
                // Image.asset(Images.splash,
                //   fit: BoxFit.cover,)
            ),
          ]),
    );
  }
}