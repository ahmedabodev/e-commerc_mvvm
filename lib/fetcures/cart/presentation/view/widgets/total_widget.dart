import 'package:e_commerc_mvvm_revirpoid/config/routes/app_routs.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

import '../../../../checkout/presentation/view_model/fetch_address_revirpoid.dart';
import '../../../../checkout/presentation/view_model/fetch_visa_revirpoid.dart';
import '../../view_model/fetch_get_favorite_revirpoid.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final getTotal=ref.watch(fetchGetCartRevirpoid);
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sub Total',style: Styles.textStylemeduim,),
                  Text(getTotal.total.sum.toString(),style: Styles.textStylemeduim,)
                ],
              ),
              const SizedBox(height: 5,),
              Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final getAddress=ref.watch(fetchGetAddressRevirpoid);
                final getPayment=ref.watch(fetchGetVisaRevirpoid);

                return               Center(
                  child: CustomButtonWidget(title: const Text('CheckOut',style: Styles.textStyleGT,),
                      onPressed: (){
                        getAddress.getData();
                        getPayment.getData();
                        Navigator.pushNamed(context, Routes.checkOutView).then((value){

                        } );
                      }, minWidth: MediaQuery.of(context).size.width/2, color: ColorsApp.foucesColor),
                );
              },),
              const SizedBox(height: 5,),
            ],
          ),
        ),
      );
    },);
  }
}
