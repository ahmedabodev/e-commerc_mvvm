import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/data/repo/home_repo_impl.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view_model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final fetchUserReviripoid=ChangeNotifierProvider<FetchUserReviripoid>((ref) => FetchUserReviripoid(HomeRepoImpl()));
class FetchUserReviripoid extends ChangeNotifier {
  FetchUserReviripoid(this.homeRepoImpl) {
    getData();
  }

  Failure? failure;
  UserModel? user ;
  HomeRepoImpl homeRepoImpl;

  getData() async {
    Either<Failure, UserModel> result = await homeRepoImpl.fetchUser();
    result.fold((fail) {
      failure = fail;
      print(fail);
    }, (respone) {
      user = respone;
      print(user);
    });
    notifyListeners();
  }
}
