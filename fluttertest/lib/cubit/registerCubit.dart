import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/cubit/states.dart';



import '../model/UserModel.dart';



class RegisterCubit extends Cubit<TripStates>{
  RegisterCubit() : super(InitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void signUp({
    required String email,
    required String password,
  }) {
    emit(SignUpLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.uid);
      createUser(
        uId: value.user!.uid,
        email: email,
      );
      emit(SignUpSuccessState(value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(SignUpErrorState());
    });
  }

  void createUser({
    required String? uId,
    required String? email,
  }) {
    emit(CreateUserLoadingState());
    UserModel model = UserModel(
        uID: uId,
        email: email,


    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState(uId!));
    }).catchError((error) {
      emit(CreateUserErrorState());
    });
  }



  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }


}