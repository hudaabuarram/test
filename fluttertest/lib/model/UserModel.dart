import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel
{
  String? uID;
  String? email;


    UserModel({
    this.uID,
    this.email,
});

  UserModel.fromJson(Map<String, dynamic>? json){
   uID = json!['uId'];
   email = json['email'];

  }

  Map<String, dynamic> toMap (){
    return {
      'uId': uID,
      'email':email,

    };
  }
}