import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/Screens/home_Screen.dart';
import 'package:fluttertest/shared/cache_helper.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:splash_screen_view/splash_screen_view.dart';

import 'Screens/LoginScreen.dart';
import 'Screens/splash_screen.dart';
import 'cubit/TripCubit.dart';
import 'cubit/states.dart';
import 'shared/bloc_observer.dart';
import 'shared/componets.dart';

void main() async {
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    MyApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
            create: (BuildContext context) => TripCubit()..getallTrips(),

        
        child: BlocConsumer<TripCubit, TripStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          },
        ));
  }
}