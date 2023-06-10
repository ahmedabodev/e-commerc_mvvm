

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/function.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/data/repo/home_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../config/routes/app_routs.dart';
final fetchSignOutRevirpoid= ChangeNotifierProvider<FetchSignOutRevirpoid>((ref) => FetchSignOutRevirpoid());
class FetchSignOutRevirpoid extends ChangeNotifier{


  Future<void> signOut({
    dynamic context
}) async {

    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(
        msg: 'SignOut Succeed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff2077ff),
        textColor: Colors.white,
        fontSize: 16.0
    );
    // Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
    Fun.saveToken();
    notifyListeners();
  }


}