import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/data/CheckOut_repo.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/address_model.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/visa_model.dart';

class CheckOutRepoImpl implements CheckOutRepo{
  bool? checkdata;

  @override
  Future<Either<Failure, List<AddressModel>>> getAddress()async {
    dynamic error;
    List<AddressModel>address=[];
   try{
     address.clear();
   await  FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('address').doc(Strings.tokenId.read('token')).get().then((value) {
       address.add(AddressModel.fromJson(value.data()!));
     }).catchError((e){
       return error=e.code;
       print('hla'+e.toString());

   });
   return Right(address);
   }catch(e){
     return left(ServerFailure(error.toString()));

   }
  }

  @override
  Future<Either<Failure, VisaModel>> getVisa()async {
    VisaModel? visaModel;
    dynamic error;
    try{

     await FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('visa').doc(Strings.tokenId.read('token')).
      get().then((value) {
        // print('hhh'+value.data().toString());

        print(value.data().toString());
        visaModel=VisaModel.fromJson(value.data()!);

      }).catchError((e){
         error=e.code;
      });



     checkdata=true;


return Right(visaModel!);
    }catch(e){
      checkdata=false;
      print('aaaaaaaa');

      return left(ServerFailure(error.toString()));
    }
  }

}