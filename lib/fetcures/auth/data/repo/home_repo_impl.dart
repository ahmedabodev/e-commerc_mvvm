import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/data/repo/home_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../presentation/view_model/user_model.dart';

class HomeRepoImpl implements HomeRepo{
  FirebaseAuth firebaseAuth =FirebaseAuth.instance;

  @override
  Future<Either<Failure, dynamic>> fetchSignIN({
     String? token,
     String? name,
     String? password,
     String? photo,
     String? email,
     String? rules,
  }) async{
    dynamic error;
    String? userId;
    try{

    await firebaseAuth.createUserWithEmailAndPassword(
          email:email.toString(),
          password: password.toString()).catchError((e){

// error=  e.code;
// print(error);
return error=e.code;

      }).then((value) {
        return userId=value.user!.uid;
     });
      return   Right(userId);

    }catch(sad){

      return  left(ServerFailure(error.toString()));

    }

  }

  @override
  Future<Either<Failure, dynamic>> fetchLogin({
    String? email,
    String? password,
    String? token,
}) async{
    dynamic error;
    String? userId;

    try{

    await  firebaseAuth.signInWithEmailAndPassword(
          email: email.toString(),
          password: password.toString()
      ).catchError((e){
        return error=e.code;

      }).then((value){
        return userId=value.user!.uid;



      });


      return   Right(userId);

    }catch(e){
      return  left(ServerFailure(error.toString()));

    }


  }

  @override
  Future<Either<Failure, UserModel>> fetchUser() async {
    dynamic error;
    UserModel? user;
    try{

      await  FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).get().then((value) {
        user=UserModel.fromJson(value.data() as Map<String, dynamic>);
print(user);
      }).catchError((e){
        print(e.code);
        return  error=e.code;
      });

      return   Right(user!);


    }catch(e){
      print(e.toString());

      return  left(ServerFailure(error.toString()));

    }
  }






}