

import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/data/CheckOutrepo_impl.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/address_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final fetchGetAddressRevirpoid=ChangeNotifierProvider<FetchGetAddressRevirpoid>((ref) => FetchGetAddressRevirpoid(CheckOutRepoImpl()));
class FetchGetAddressRevirpoid extends ChangeNotifier{
  FetchGetAddressRevirpoid(this.checkOutRepoImpl){
    getData();
  }
  CheckOutRepoImpl checkOutRepoImpl;
  Failure? failure;
  bool? checkdata;
  List<AddressModel>address=[];
  getData()async{
    Either<Failure,List<AddressModel>>result=await checkOutRepoImpl.getAddress();
    result.fold((fail) {
      failure=fail;
    }, (respone) {
      address=respone;
      checkdata=checkOutRepoImpl.checkdata;

      print(address);
    });
    notifyListeners();
  }

}