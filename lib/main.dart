import 'dart:io';

import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/login_view.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/home/presentation/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/routes/app_routs.dart';
import 'core/utils/const.dart';
import 'core/utils/function.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp();
  Fun.tokenFun();
  Fun.saveToken();
await GetStorage.init();
  runApp(Phoenix(child: const ProviderScope(child:  MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: ColorsApp.primewhite
      ),
      home:(Strings.checkUser==true)?const HomeView() : const LoginView(),
      onGenerateRoute: AppRoutes.generateRoute,

    );
  }
}


