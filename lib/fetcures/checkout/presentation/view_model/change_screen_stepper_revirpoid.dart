

import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view/widget/payment_widget.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view/widget/stepper_widget.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/favorit/presentation/view/favorit_view.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view/checkout_view.dart';

final changeScreenSteeperRevirpoid =ChangeNotifierProvider<ChangeScreenSteeperRevirpoid>((ref) => ChangeScreenSteeperRevirpoid());
class ChangeScreenSteeperRevirpoid extends ChangeNotifier{
 int index =0;
 int checkIndex =0;
 List<Widget>screens=[
    StepperWidget(),
    PaymentWidget(),
    const SummaryWidget(),
 ];
 changeIndex(value){
   index=value;
   notifyListeners();
 }
 changeCheckIndex(value){
   checkIndex=value;
   notifyListeners();
 }
}