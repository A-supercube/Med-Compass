import 'package:flutter/material.dart';
import 'package:med_compass/pages/WelcomeScreen.dart';

class BuildProfileScreen extends StatelessWidget {
  const BuildProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Container(style: TextStyle()),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/avatar_profile.jpg'), // Replace with your image path
                ),
                SizedBox(height: 16),
                Text(
                  'John Doe',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 8),
                Text('Email',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0))),
                SizedBox(height: 8),
                Text(' example@gmail.com',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0))),
                SizedBox(height: 16),
                Text('Phone Number',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0))),
                SizedBox(height: 8),
                Text('0123456789',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0))),
                SizedBox(height: 16),
                Text('Sex',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0))),
                SizedBox(height: 8),
                Text('Address',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0))),
                SizedBox(height: 8),
                Text('1234 Street, City, State',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0))),
                SizedBox(height: 16),
                Text('Date of Birth',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0))),
                SizedBox(height: 8),
                Text('01/01/2000',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
