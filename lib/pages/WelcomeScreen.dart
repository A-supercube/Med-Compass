import 'package:flutter/material.dart';
import 'package:med_compass/pages/regScreen.dart';

import 'loginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 63, 23, 184),
          Color.fromARGB(255, 235, 228, 240),
        ])),
        child: Column(children: [
          Container(
            height: 100,
            width: double.infinity,

          ),
         
          
           Container(
            
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25),)
            ),
            child: Center(child: Text("djgnsdglsgm djgnsdglsgm djgnsdglsgm djgnsdglsgm djgnsdglsgm")),
            
          ),
          const SizedBox(
            height: 300,
          ),
          MaterialButton(
            
            onPressed:() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPage()));
          } ,
            child: Container(
              // alignment: Alignment.bottomCenter,
              // margin: EdgeInsets.only(top: 20),
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          //const Spacer(),

          //const Image(image: AssetImage('assets/social.png'))
        ]),
      ),
    );
  }
}
