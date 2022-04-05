import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/TripCubit.dart';
import '../cubit/states.dart';
import '../model/tripmodel.dart';
import '../shared/componets.dart';

class OuterTrip extends StatelessWidget{
  TripModel? trip;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripCubit, TripStates>(
        listener: (context, state) {},
    builder: (context, state) {
      List<TripModel>? book = TripCubit
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
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },icon:Icon(Icons.arrow_back),),
                  SizedBox(width: 5,),
                  Text(
                    "Utenlandsturer ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  counterText: '',
                  hintText: "Search for places,destination",
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
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 800,
                child: ListView.builder
                  (
                    itemCount: book?.length,
                    itemBuilder: (context, int index) =>
                      bookbuild(context,book![index]),


                ),
              ),

            ],
          ),
        ),
      );
    }
     );


}
}