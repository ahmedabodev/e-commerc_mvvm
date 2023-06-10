import 'dart:io';

import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Fun{
  static  tokenFun()async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await FirebaseMessaging.instance.getToken().then((token) {
      Strings.myToken=token.toString();
    });
  }
  static saveToken()async{
    FirebaseAuth firebaseAuth =FirebaseAuth.instance;
    var user=firebaseAuth.currentUser;
    if(user==null){
      Strings.checkUser=false;
    }
    else{
      Strings.checkUser=true;

    }
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}