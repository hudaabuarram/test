
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/model/tripmodel.dart';

import '../Screens/detailestrip.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/tripsbook.dart';
import 'cache_helper.dart';


Widget defaultButton(
        {Color background = Colors.blue,
        double width = double.infinity,
        double radius = 0.0,
        required Function function,
        required String text,}) =>
    Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String label,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  bool isPassword = false,
  FormFieldValidator<String>? validate,
  required String hinttext,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(

      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        hintText: hinttext,
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );



Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text,style: TextStyle(textBaseline: TextBaseline.alphabetic
          ,color: Colors.blue

      ),),

    );


String ?uId = '';


void signOut(context) {

  CacheHelper.removeData(key:'uId');
  navigateAndFinish(
    context,
    LoginScreen(),
  );

}

Widget innerbuild(context,TripModel trip)=>InkWell(
  onTap: () {
    navigateTo(context, Detailestrip(trip));
     },
    child:
    Card(


      shadowColor: Colors.white70,

      shape: OutlineInputBorder(

          borderRadius: BorderRadius.circular(10),

          borderSide: BorderSide(color: Colors.transparent)

      ),

      elevation: 40,

      color: Colors.white70,

      clipBehavior: Clip.antiAlias,

      child: Container(

        margin: EdgeInsets.symmetric(

            horizontal: 6, vertical: 6),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Stack(
          alignment: Alignment.bottomRight,
              children:[
                Container(

                width: 300,

                height: 150,

                decoration: BoxDecoration(


                    color: Colors.transparent,

                    image: new DecorationImage(

                      image: NetworkImage('${trip.image}'),

                      fit: BoxFit.cover,

                    ),

                    borderRadius: BorderRadius.circular(10)


                ),
        ),

                // child: Align(
                //
                //
                //   alignment: Alignment.bottomRight,
                //
                //   child: SizedBox(
                //
                //     height: 40,
                     Stack(
                      alignment: Alignment.center,
                      children:[
                      FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.deepOrange,


                        onPressed: () {},

                        elevation: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepOrangeAccent.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(3, 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward),]
                    ),

                    // child: Container(
                    //
                    //   decoration: BoxDecoration(
                    //
                    //     color: Colors.transparent,
                    //
                    //     borderRadius: BorderRadius.all(
                    //
                    //       Radius.circular(100),
                    //
                    //     ),
                    //
                    //     boxShadow: [
                    //
                    //       BoxShadow(
                    //
                    //         color: Colors.orange.withOpacity(
                    //
                    //             0.2),
                    //
                    //         spreadRadius: 5,
                    //
                    //         blurRadius: 5,
                    //
                    //         offset: Offset(5, 5),
                    //
                    //       ),
                    //
                    //     ],
                    //
                    //
                    //   ),
                    //
                    //   child: FloatingActionButton(
                    //
                    //
                    //     onPressed: () {},
                    //
                    //     elevation: 10,
                    //
                    //     backgroundColor: Colors.deepOrange,
                    //
                    //     child: Icon(Icons.arrow_forward),
                    //
                    //   ),
                    //
                    // ),

                  //),

              //  ),


           ] ),

            SizedBox(height: 5,),

            Text('${trip.name}', style: TextStyle(

                fontSize: 20,

                fontWeight: FontWeight.bold

            ),),

            SizedBox(height: 5,),

            Text('${trip.face}', style: TextStyle(

                fontSize: 15,

                color: Colors.grey.shade700

            ),),

            SizedBox(height: 5,),

            Row(

              crossAxisAlignment: CrossAxisAlignment.start,


              children: [

                Icon(Icons.date_range, size: 20,

                  color: Colors.grey.shade700,),

                SizedBox(width: 10,),


                Text('${trip.fdate}', style: TextStyle(

                    fontSize: 14,

                    color: Colors.grey.shade700

                ),),

                SizedBox(width: 10,),

                Text('${trip.price}' + '/' + '${trip.days}' + 'degree',
                  style: TextStyle(

                      fontSize: 13,

                      color: Colors.grey.shade700

                  ),),


              ],

            ),


          ],

        ),

      ),
    )
  );
Widget bookbuild(context,TripModel trip)=>InkWell(
    onTap: () { navigateTo(context, Detailestrip(trip));
    },
    child:
  Card(
shadowColor: Colors.grey,
shape: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide(color: Colors.transparent)
),
elevation: 40,
color: Colors.white70,
clipBehavior: Clip.antiAlias,
child: Container(
margin: EdgeInsets.symmetric(
horizontal: 5, vertical: 5),
child: Row(
children: [
Container(
height: 100,
width: 100,
decoration: BoxDecoration(
    image: new DecorationImage(

      image: NetworkImage('${trip.image}'),

      fit: BoxFit.cover,

    ),

    borderRadius: BorderRadius.circular(20),
color: Colors.pink
),
),
SizedBox(width: 15,),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
SizedBox(height: 5,),
Text('${trip.name}', style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold
),),
SizedBox(height: 5,),
Text('${trip.face}', style: TextStyle(
fontSize: 15,
color: Colors.grey.shade700
),),
SizedBox(height: 5,),
Row(
crossAxisAlignment: CrossAxisAlignment
    .start,

children: [
Icon(Icons.date_range, size: 20,
color: Colors.grey.shade700,),
SizedBox(width: 10,),
Text('${trip.fdate}', style: TextStyle(
fontSize: 14,
color: Colors.grey.shade700
),),


]),
SizedBox(height: 5,),
Row(
crossAxisAlignment: CrossAxisAlignment
    .start,

children: [
Text("Pris:", style: TextStyle(
fontSize: 14,
fontWeight: FontWeight.bold
),),
SizedBox(width: 5,),
Text('${trip.price}' + '/' +
'${trip.days}' + 'degree',
style: TextStyle(
fontSize: 12,
color: Colors.grey.shade700
),),


]),


],
),
Spacer(),
Align(

alignment: Alignment.bottomRight,
child: SizedBox(
height: 40,
child: Container(
decoration: BoxDecoration(
// shape: BoxShape.circle,
color: Colors.transparent,
borderRadius: BorderRadius.all(
Radius.circular(100),
),
boxShadow: [
BoxShadow(
color: Colors.orange.withOpacity(0.2),
spreadRadius: 5,
blurRadius: 5,
offset: Offset(5, 5),
),
],

),
child: FloatingActionButton(
onPressed: () {},
elevation: 20,
backgroundColor: Colors.deepOrange,
child: Icon(Icons.arrow_forward),
),
),
),
),
],
),
),
));
