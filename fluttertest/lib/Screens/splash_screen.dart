

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/Screens/LoginScreen.dart';

import '../shared/cache_helper.dart';
import '../shared/componets.dart';
import 'home_Screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((v) {
      uId = CacheHelper.getData(key: 'uId');
      if (uId != null) {
        navigateAndFinish(
          context,

          HomeScreen());
      } else {
        navigateAndFinish(
          context,
            LoginScreen());
      }

    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(


          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/bac.png'),
            ),
          ),
          child: Center(
            child: Container(
              color: Colors.blue.withOpacity(0.1),

            ),
          ),
        ));
  }
}
