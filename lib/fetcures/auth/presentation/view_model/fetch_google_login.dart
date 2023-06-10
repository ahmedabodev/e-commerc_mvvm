

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/data/repo/home_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../config/routes/app_routs.dart';
final fetchGoogleLoginRevirpoid= ChangeNotifierProvider<FetchGoogleLoginRevirpoid>((ref) => FetchGoogleLoginRevirpoid());
class FetchGoogleLoginRevirpoid extends ChangeNotifier{

  dynamic googleData;
  Future<UserCredential> signInWithGoogle({
    String? token,
    dynamic context,
}) async {

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,

    );
    googleData=googleUser;
    print(googleUser!.id);
    Strings.tokenId.write('token', googleUser.id);

    FirebaseFirestore.instance.collection('users').doc(googleUser.id.toString()).set({
      'id':googleUser.id,
      'name':googleUser.displayName,
      'photo':googleUser.photoUrl,
      'token':token,
      'phone':null,
      'email':googleUser.email,
      'rules':'user',
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
    notifyListeners();

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }



}