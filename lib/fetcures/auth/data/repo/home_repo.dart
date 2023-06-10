import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class HomeRepo{
  Future<Either<Failure,dynamic>>fetchSignIN();
  Future<Either<Failure,dynamic>>fetchLogin();
  Future<Either<Failure,UserModel>>fetchUser();

}