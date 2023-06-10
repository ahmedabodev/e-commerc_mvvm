import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/widgets/custom_button_widget.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/widgets/text_form_custom.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/add_address_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/change_screen_stepper_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/fetch_visa_revirpoid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/fetch_address_revirpoid.dart';

class StepperWidget extends StatelessWidget {
  StepperWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController streetController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController countryController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final getAddress=ref.watch(fetchGetAddressRevirpoid);
      final getPayment=ref.watch(fetchGetVisaRevirpoid);

      if(getAddress.address.isEmpty){
      }else{

        streetController.text=getAddress.address[0].street;
        cityController.text=getAddress.address[0].city;
        phoneController.text=getAddress.address[0].phone;
        countryController.text=getAddress.address[0].country;
      }
      return  Form(
        key: _formKey,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Street',style: Styles.textStyle16,),
                TextFromCustom(
                  controller: streetController,
                  hintText: ' Enter your Street',
                  validator: (value){
                    if(value!.isEmpty){
                      return 'PLease Enter Street';
                    }
                  },
                ),
                const Text('City',style: Styles.textStyle16,),
                TextFromCustom(
                    controller: cityController,
                    hintText: ' Enter your City',
                    validator: (value){
                      if(value!.isEmpty){
                        return 'PLease Enter City';
                      }}
                ),
                const Text('Phone',style: Styles.textStyle16,),
                TextFromCustom(
                    length: true,
                    hintText: ' Enter your Phone',
                    controller: phoneController,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'PLease Enter Phone';
                      }else if(value.length!=11){
                        return 'PLease Enter Phone';

                      }

                    }
                ),
                const Text('Country',style: Styles.textStyle16,),
                TextFromCustom(
                    controller: countryController,
                    hintText: ' Enter your Country',
                    validator: (value){
                      if(value!.isEmpty){
                        return 'PLease Enter Country';
                      }}

                ),
                Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final steeper=ref.watch(changeScreenSteeperRevirpoid);
                  return    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButtonWidget(
                          title: const Text('Back',style: Styles.textStyle14,),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          minWidth: MediaQuery.of(context).size.width/2.5,
                          color: ColorsApp.foucesColor),
                      CustomButtonWidget(
                          title: const Text('Next',style: Styles.textStyle14,),
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              AddAddress.addAddress(
                                phone: phoneController.text,
                                city: cityController.text,
                                country: countryController.text,
                                street: streetController.text,
                              );
                              getPayment.getData();
                              steeper.changeIndex(steeper.index+1);
                              print(steeper.index.toString());
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
        ),
      );
    },);
  }
}
