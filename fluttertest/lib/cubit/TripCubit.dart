import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/cubit/states.dart';

import '../model/UserModel.dart';
import '../model/tripmodel.dart';

class TripCubit extends Cubit<TripStates> {
  TripCubit() : super(InitialState());

  static TripCubit get(context) => BlocProvider.of(context);


  UserModel? model;
   TripModel? trip;
 // bool? isbook;
//   initialfunction(){
//     trips.forEach((element) {settrips(element);});
//   }
//
// void settrips(TripModel Trip){
//   FirebaseFirestore.instance
//       .collection('trips')
//       .add(Trip.toMap())
//       .then((value) {
//     emit(SettripSuccessState());
//   }).catchError((error) {
//     print(error.toString());
//     emit(SettripErrorState());
//   });
//
// }

  List<TripModel>? innertrips = [];
  List<TripModel>? outertrips = [];
  List<TripModel>? bookedtrips = [];

  void getallTrips() {
    FirebaseFirestore.instance
        .collection('trips')
        .get().then((value)
    {
      innertrips = [];
      outertrips = [];
      bookedtrips = [];
      value.docs.forEach((element) {
        if (element.data()['type'] == 'inner') {
          innertrips?.add(TripModel.fromJson(element.data()));
        }
        if (element.data()['type'] == 'outer') {
          outertrips?.add(TripModel.fromJson(element.data()));
        }

        if (element.data()['isbook'] == true) {
          bookedtrips?.add(TripModel.fromJson(element.data()));}
      });
      emit(GettripSuccessState());
    });
  }
  late String tt='Book Now';
 ChangeText(){
    emit(ChangeTextState());

  tt=  trip!.isbook ?'Cancel':'Book Now';

}
  void bookedTrips(String? id) {
    print(id);
    FirebaseFirestore.instance
        .collection('trips').doc(id)
        .get().then((value)

    {print(value.data());
      trip=TripModel.fromJson(value.data());
    print(trip?.isbook);
    trip?.isbook=!trip!.isbook;
    print(trip?.isbook);
    print(trip?.toMap());
     FirebaseFirestore.instance.collection('trips').doc(id)
         .update(trip!.toMap())
         .then((value) {
           print('hhholik');
      //print (value);
       emit(BookedtripsuccessState());
           FirebaseFirestore.instance
               .collection('trips').doc(id)
               .get().then((value)

           {print(value.data());});
     });


  });
        }
}