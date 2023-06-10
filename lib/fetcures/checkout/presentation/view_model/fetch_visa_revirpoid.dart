

import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/data/CheckOutrepo_impl.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/address_model.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/visa_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final fetchGetVisaRevirpoid=ChangeNotifierProvider<FetchGetVisaRevirpoid>((ref) => FetchGetVisaRevirpoid(CheckOutRepoImpl()));
class FetchGetVisaRevirpoid extends ChangeNotifier{
  FetchGetVisaRevirpoid(this.checkOutRepoImpl){
    getData();
  }
  CheckOutRepoImpl checkOutRepoImpl;
  Failure? failure;
  VisaModel? visaModel;
  bool? checkdata;
  getData()async{
    Either<Failure,VisaModel>result=await checkOutRepoImpl.getVisa();
    result.fold((fail) {
      failure=fail;
      print(fail);
      checkdata=checkOutRepoImpl.checkdata;

    }, (respone) {
      visaModel=respone;
      checkdata=checkOutRepoImpl.checkdata;
      print(visaModel!.cardNumber);
    });
    notifyListeners();
  }

}