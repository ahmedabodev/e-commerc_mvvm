
import 'package:dartz/dartz.dart';
import 'package:e_commerc_mvvm_revirpoid/core/errors/errors.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/visa_model.dart';

import '../presentation/view_model/address_model.dart';

abstract class CheckOutRepo{
  Future<Either<Failure,List<AddressModel>>>getAddress();
  Future<Either<Failure,VisaModel>>getVisa();

}