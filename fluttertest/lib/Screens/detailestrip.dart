import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/model/tripmodel.dart';

import '../cubit/TripCubit.dart';
import '../cubit/states.dart';
import '../shared/componets.dart';

class Detailestrip extends StatelessWidget{
  TripModel trip;
  Detailestrip(this.trip);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripCubit, TripStates>(
        listener: (context, state) {},
    builder: (context, state) {
    return Scaffold(

      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://22arabi.com/wp-content/uploads/2020/03/Zermatt-Switzerland-1200x853-1-780x470.jpg'),fit: BoxFit.cover
                )
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 50,),
                      CircleAvatar(
                        child:Text('1/6',style: TextStyle(fontSize: 15,color: Colors.grey[600])),
                        backgroundColor: Colors.grey[400],
                      ),


                      SizedBox(width: 10,),
                      CircleAvatar( child:Icon(
                        Icons.volume_mute_sharp,
                        color: Colors.grey[600],
                        size: 27,
                      ),

                        backgroundColor: Colors.grey[400],
                      ),


                    ],
                  ),
                ),
                Container(
                  height: 500,
                  width: double.infinity,

                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      )),

                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [ Row(


                              mainAxisAlignment: MainAxisAlignment.start,

                          children: [

                            Icon(Icons.date_range, size: 20,

                              color: Colors.grey.shade600,),

                            SizedBox(width: 5,),


                            Text('${trip.fdate}' + ' - ' + '${trip.ldate}' ,style: TextStyle(

                                fontSize: 13,fontWeight:FontWeight.bold ,

                                color: Colors.grey.shade600

                            ),),

]),
                            SizedBox(height: 20,),



                            Text('${trip.name}',style: TextStyle(fontSize:26,fontWeight:FontWeight.bold ,color: Colors.black)),
                            Text('${trip.face}',style: TextStyle(fontSize:16,fontWeight:FontWeight.w500 ,color: Colors.grey.shade600)),
                            SizedBox(height: 20,),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              color: Colors.grey[300],
                            ),
                            SizedBox(height: 20,),
                            Text('${trip.discription}',style: TextStyle(fontSize:15 ,fontWeight:FontWeight.w500,color: Colors.grey.shade600)),
                            SizedBox(height: 50,),
                            Row(
                              children: [
                                Text('Program',style: TextStyle(fontSize:15 ,fontWeight:FontWeight.w700,color: Colors.grey.shade700)),
                                Spacer(),
                                Text('Dag 1 av 4',style: TextStyle(fontSize:13 ,fontWeight:FontWeight.w500,color: Colors.blue)),
                              ],
                            ),
                                SizedBox(height: 10,),
                                Container(
                                  width: double.infinity,
                                  height: 1.0,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(height: 20,),
                                 Container(
                                 width: double.infinity,
                                  height: 170,
                                   decoration: BoxDecoration(
                                  color: Colors.transparent,
                                   image: new DecorationImage(
                                   image: NetworkImage('${trip.image}'),
                                   fit: BoxFit.cover,

                              ),

                              borderRadius: BorderRadius.circular(10)


                          ),),
                            SizedBox(height: 20,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Dag 1',style: TextStyle(fontSize:15 ,fontWeight:FontWeight.w700,color: Colors.grey.shade700)),
                                  SizedBox(width: 100,),



                                  Text('Tirsday,8,juni' ,textAlign: TextAlign.center,style: TextStyle(

                                      fontSize: 13,fontWeight:FontWeight.bold ,

                                      color: Colors.grey.shade400

                                  ),),
                                  Spacer(),
                                  Text('9:00 - 13:00',style: TextStyle(fontSize:13 ,fontWeight:FontWeight.bold ,

                                      color: Colors.grey.shade400)),


                                ]),

                            SizedBox(height:20,),
                            Text('${trip.discription}',style: TextStyle(fontSize:15 ,fontWeight:FontWeight.w500,color: Colors.grey.shade600)),
                            SizedBox(height: 30,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.arrow_back_ios,size: 18,color: Colors.grey.shade400 ,),
                                  Text('Forrige dag',style: TextStyle(fontSize:15 ,fontWeight:FontWeight.w700,color: Colors.grey.shade400)),
                                  SizedBox(width: 10,),



                                  Text('Neste dag' ,style:TextStyle(fontSize:15 ,fontWeight:FontWeight.w700,color: Colors.blue)),

                                  Icon(Icons.arrow_forward_ios,size: 18,color: Colors.blue),

                                ]),
                            SizedBox(height: 30,),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: MaterialButton(
                            color: Colors.red,
                            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.transparent)),
                            onPressed: (){
                              //print(trip.id);
                              TripCubit.get(context).bookedTrips(trip.id);
                              TripCubit.get(context).getallTrips();
                             TripCubit.get(context).ChangeText();

                            },
                            child: Text(//'jjjj',

                              TripCubit.get(context).tt,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        )




                          ],
                            ),
                      ),
                    ),

                    ),


              ],
            ),
          ),
        ],
      ),
    );});
  }

}