

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/data/repo/home_repo_impl.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/data/CheckOutrepo_impl.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/fetch_address_revirpoid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../config/routes/app_routs.dart';
final fetchLoginRevirpoid= ChangeNotifierProvider<FetchLoginRevirpoid>((ref) => FetchLoginRevirpoid(HomeRepoImpl()));
class FetchLoginRevirpoid extends ChangeNotifier{
  FetchLoginRevirpoid(this.homeRepoImpl);
  final HomeRepoImpl homeRepoImpl;
  Failure? failure;
  dynamic profile;
  dynamic userId;
 Future getData({
    String? token,
    String? password,
    String? email,
    dynamic context,
  })async{
    Either<Failure,dynamic>result=await homeRepoImpl.fetchLogin(
        email:email  ,
        password:password  ,
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
      Strings.tokenId.write('token', userId);
      FirebaseFirestore.instance.collection('users').doc(userId.toString()).update(
          {
            'token':token,
          });
      Fluttertoast.showToast(
          msg: 'Login Succeed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xff2077ff),
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.homeView, (route) => false);
    });
    notifyListeners();
  }


}