import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/assets.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/widgets/custom_button_widget.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view/checkout_view.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view/widget/text_Form_visa.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/change_screen_stepper_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/fetch_visa_revirpoid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/fetch_address_revirpoid.dart';

class PaymentWidget extends StatelessWidget {
  PaymentWidget({Key? key}) : super(key: key);

  final _formKey=GlobalKey<FormState>();
  TextEditingController numberController =TextEditingController();
  TextEditingController expiredDataController =TextEditingController();
  TextEditingController cvvController =TextEditingController();
  TextEditingController cardNameController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final checkBox=ref.watch(changeScreenSteeperRevirpoid);
      final getVisa=ref.watch(fetchGetVisaRevirpoid);
      print(getVisa.checkdata);
      if(getVisa.visaModel==null){
        print('hey');
      }else{

        numberController.text=getVisa.visaModel!.cardNumber;
        cardNameController.text=getVisa.visaModel!.cardName;
        cvvController.text=getVisa.visaModel!.cvv;
        expiredDataController.text=getVisa.visaModel!.expiredData;


      }

      return Form(
        key: _formKey,
        child: Expanded(
          child: ListView(
            children: [
              Card(
                color:(checkBox.checkIndex==0)?ColorsApp.foucesColor:Colors.white,
                child: Row(
                  children:  [
                    const SizedBox(width: 10,),
                    const Text('Cash Pay',style: Styles.textStyle16,),
                    const Spacer(),
                    Checkbox(value:(checkBox.checkIndex==1)?false: true, onChanged: (value){
                      checkBox.changeCheckIndex(0);
                    },
                      activeColor: Colors.indigo,
                    ),
                    const SizedBox(width: 10,),

                  ],
                ),
              ),
              Card(
                color:(checkBox.checkIndex==1)?ColorsApp.foucesColor:Colors.white,

                child: Row(

                  children:  [
                    const SizedBox(width: 10,),
                    const Text('Visa',style: Styles.textStyle16,),
                    const Spacer(),
                    Checkbox(value:(checkBox.checkIndex==1)?true: false, onChanged: (value){
                      checkBox.changeCheckIndex(1);

                    },
                      activeColor: Colors.indigo,
                    ),
                    const SizedBox(width: 10,),


                  ],
                ),
              ),
              const SizedBox(height: 10,),
              (checkBox.checkIndex==1)? Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 8,),
                      Image.asset(Assetstring.visa,height: 50,),
                      const SizedBox(width: 8,),
                      Image.asset(Assetstring.masterCard,height: 50,),
                      const SizedBox(width: 8,),
                      Image.asset(Assetstring.americanExpress,height: 50,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormVisa(
                    split: 19,
                    length:22 ,
                    num: true,
                    label: 'Number', controller: numberController,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Card Number ';
                      }else if(value.length!=22){
                        return 'Please Enter  Card Number ';

                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(

                        child: TextFormVisa(
                          split: 4,
                          data: true,
                          length:5 ,
                          num: true,
                          label: 'Expired Data', controller: expiredDataController,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please Enter Expired Data ';
                            }else if(value.length!=5){
                              return 'Please Enter  Card Number ';

                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: TextFormVisa(
                          split: 3,
                          length:3 ,
                          num: true,
                          label: 'CVV', controller: cvvController,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please Enter CVV ';
                            }else if(value.length!=3){
                              return 'Please Enter  Card Number ';

                            }
                          },

                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormVisa(
                    split: 1,
                    num: false,
                    length: 1,
                    label: 'Card Name', controller: cardNameController,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Card Name ';
                      }
                    },

                  ),
                ],
              ):const SizedBox(),
              const SizedBox(height: 10,),

              Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final steeper=ref.watch(changeScreenSteeperRevirpoid);
                final getAddress=ref.watch(fetchGetAddressRevirpoid);
                final getVisa=ref.watch(fetchGetVisaRevirpoid);
                return    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButtonWidget(
                        title: const Text('Back',style: Styles.textStyle14,),
                        onPressed: (){
                          getAddress.getData();
                          steeper.changeIndex(steeper.index-1);

                        },
                        minWidth: MediaQuery.of(context).size.width/2.5,
                        color: ColorsApp.foucesColor),
                    CustomButtonWidget(
                        title: const Text('Next',style: Styles.textStyle14,),
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            if(steeper.checkIndex==1){
                              FirebaseFirestore.instance.collection('users').doc(Strings.tokenId.read('token')).collection('visa').doc(Strings.tokenId.read('token')).set({
                                'cardName':cardNameController.text,
                                'cvv':cvvController.text,
                                'expiredData':expiredDataController.text,
                                'cardNumber':numberController.text,
                              });
                              getVisa.getData();

                              steeper.changeIndex(steeper.index+1);


                            }else{
                              steeper.changeIndex(steeper.index+1);

                            }
                          }
                        },
                        minWidth: MediaQuery.of(context).size.width/2.5,
                        color: ColorsApp.foucesColor),
                  ],
                );
              },),


            ],
          ),
        ),
      );
    },);
  }
}
