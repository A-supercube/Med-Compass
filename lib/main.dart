import 'package:med_compass/pages/WelcomeScreen.dart';
import 'package:med_compass/pages/loginScreen.dart';
// import 'package:med_compass/pages/loginscreen1.dart';
import 'package:med_compass/pages/regScreen.dart';
// import 'package:med_compass/pages/regscreen1.dart';
import 'package:med_compass/pages/tabs_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'appwrite/auth_api.dart';

void main() {
  // runApp(const MyApp());
  runApp(ChangeNotifierProvider(
      create: ((context) => AuthAPI()), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<AuthAPI>().status;
    print('TOP CHANGE Value changed to: $value!');

    return MaterialApp(
        title: 'Appwrite Auth Demo',
        debugShowCheckedModeBanner: false,
        home: value == AuthStatus.uninitialized
            ? const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              )
            : value == AuthStatus.authenticated
                ? const TabsPage()
                : const WelcomeScreen(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.blue,
          ),
        ));
  }
}
