import 'package:e_commerc_mvvm_revirpoid/config/routes/app_routs.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/assets.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view_model/fetch_sign_out_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/cart/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../checkout/presentation/view_model/fetch_address_revirpoid.dart';
import '../../../../checkout/presentation/view_model/fetch_visa_revirpoid.dart';

class WidgetAppBarCart extends StatelessWidget {
  const WidgetAppBarCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final signOut=ref.watch(fetchSignOutRevirpoid);
      final getCart=ref.watch(fetchGetCartRevirpoid);
      final getAddress=ref.watch(fetchGetAddressRevirpoid);
      final getPayment=ref.watch(fetchGetVisaRevirpoid);
      return           Badge(
        isLabelVisible: (getCart.cart.isEmpty)?false:true,
        label: Text(getCart.cart.length.toString()),
        child: IconButton(onPressed: (){
          getAddress.getData();
          getPayment.getData();
         Navigator.pushNamed(context, Routes.cartView);
        }, icon:Image.asset(Assetstring.cart,height: 30,color: Colors.blueGrey,)),
      );
    },);
  }
}
