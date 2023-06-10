

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/data/repo/home_repo_impl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../config/routes/app_routs.dart';
final fetchSignInRevirpoid= ChangeNotifierProvider<FetchSignInRevirpoid>((ref) => FetchSignInRevirpoid(HomeRepoImpl()));
class FetchSignInRevirpoid extends ChangeNotifier{
  FetchSignInRevirpoid(this.homeRepoImpl);
 final HomeRepoImpl homeRepoImpl;
  Failure? failure;
dynamic profile;
dynamic userId;
  getData({
    String? token,
    String? name,
    String? password,
    String? photo,
    String? email,
    String? rules,
    String? phone,
    dynamic context,
})async{
    Either<Failure,dynamic>result=await homeRepoImpl.fetchSignIN(
      rules:rules ,
      email:email  ,
      name:name  ,
      password:password  ,
      photo:photo  ,
      token:token
    );
    result.fold((fail){
      Fluttertoast.showToast(
          msg:fail.errMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:ColorsApp.foucesColor,
          textColor: Colors.white,
          fontSize: 16.0
      );

      print(fail.errMessage);
    }, (respons) {
      userId=  respons;
      print(userId);
      FirebaseFirestore.instance.collection('users').doc(userId).set(
          {
            'id':userId,
            'name':name,
            'photo':photo,
            'token':token,
            'phone':phone,
            'email':email,
            'rules':rules,

          });
      Fluttertoast.showToast(
          msg:'Register Succeed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:ColorsApp.foucesColor,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Strings.photo=null;
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
    });
    notifyListeners();
  }


}