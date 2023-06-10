import 'package:e_commerc_mvvm_revirpoid/core/utils/assets.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/widgets/custom_button_widget.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view_model/fetch_google_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../cart/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import '../../../../checkout/presentation/view_model/fetch_address_revirpoid.dart';
import '../../../../checkout/presentation/view_model/fetch_visa_revirpoid.dart';
import '../../../../favorit/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import '../../view_model/fetch_user_revirpoid.dart';
import 'custom_feild_phone.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final googleLogin =ref.watch(fetchGoogleLoginRevirpoid);
      final profile=ref.watch(fetchUserReviripoid);
      final getCart=ref.watch(fetchGetCartRevirpoid);
      final getFavorite=ref.watch(fetchGetFavoriteRevirpoid);
      final getAddress=ref.watch(fetchGetAddressRevirpoid);
      final getPayment=ref.watch(fetchGetVisaRevirpoid);
      return  CustomButtonWidget(
        title: SizedBox(
          width: MediaQuery.of(context).size.width/1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Image.asset(Assetstring.google),
              const SizedBox(width: 10,),
              const Text('Sign In with Google',style: Styles.textStyle16,)
            ],
          ),
        ),
        color: Colors.blueGrey,
        minWidth: MediaQuery.of(context).size.width/1.2,
        onPressed: (){
          googleLogin.signInWithGoogle(
            token: Strings.myToken,
            context: context,
          ).then((value) {
            profile.getData();
            getCart.getData();
            getFavorite.getData();
            getAddress.getData();
            getPayment.getData();
          });

          // showModalBottomSheet(
          //   context: context,
          //   builder: (context) {
          //     TextEditingController phoneController=TextEditingController();
          //     final formKey = GlobalKey<FormState>();
          //     return Form(
          //       key: formKey,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text('Enter Phone Number',style: Styles.textStyle16.copyWith(
          //             color: Colors.blue
          //           ),),
          //           const SizedBox(height: 10,),
          //
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //             child: TextFromPhone(
          //               validator: (value){
          //                 if(value!.isEmpty){
          //                   return 'Please Enter PhoneNumber';
          //                 }
          //               },
          //               controller: phoneController,
          //               hintText: 'Phone',
          //
          //             ),
          //           ),
          //           const SizedBox(height: 20,),
          //           Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          //             final googleLogin=ref.watch(fetchGoogleLoginRevirpoid);
          //             return                   CustomButtonWidget(title: const Text('Confirm',style: Styles.textStyle14,),
          //                 onPressed: (){
          //                   if(formKey.currentState!.validate()){
          //                     googleLogin.signInWithGoogle(
          //                       token: Strings.myToken,
          //                       context: context,
          //                       phone: phoneController.text
          //                     );
          //                   }
          //                 },
          //                 minWidth: MediaQuery.of(context).size.width/1.5,
          //                 color: ColorsApp.foucesColor);
          //           },)
          //         ],
          //       ),
          //     );
          //   },
          // );
        },

      );
    },);
  }
}
