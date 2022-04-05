import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/Screens/innertrip.dart';
import 'package:fluttertest/Screens/tripsbook.dart';

import '../cubit/TripCubit.dart';
import '../cubit/states.dart';
import '../model/tripmodel.dart';
import '../shared/componets.dart';
import 'outertrip.dart';

class HomeScreen extends StatelessWidget {
  TripModel? trip;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripCubit, TripStates>(
        listener: (context, state) {},
    builder: (context, state) {
      List<TripModel>? inner = TripCubit
          .get(context)
          .innertrips;
      List<TripModel>? outer = TripCubit
          .get(context)
          .outertrips;
      return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Turer ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        signOut(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.blue),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'SignOut',
                            style: TextStyle(
                                color: Colors.blue),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 50,
                child: TextField(

                  decoration: InputDecoration(

                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.blue,
                    ),
                    counterText: '',
                    hintText: "Type here",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Innenlandsturer ",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: (){
                      navigateTo(context, InnerTrip());
                    },
                    child: Text(
                      "see more ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 260,
                width: 300,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 22,
                      childAspectRatio: 150 / 150),
                  itemBuilder: (context, index) => innerbuild(context,inner![index]),


                  itemCount: inner?.length,
                ),
              ),
              SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Utenlandsturer ",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: (){navigateTo(context, OuterTrip());},
                    child: Text(
                      "see more ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 260,
                width: 300,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 22,
                      childAspectRatio: 150 / 150),
                  itemBuilder: (context, index) =>innerbuild(context,outer![index]),

                  itemCount: outer?.length,
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {navigateTo(context, Tripbook());},
          elevation: 20,
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.bookmark),
        ),
      );
    } );


}


}