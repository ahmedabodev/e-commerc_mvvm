import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/fetch_address_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view_model/fetch_visa_revirpoid.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/favorit/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../cart/presentation/view_model/fetch_get_favorite_revirpoid.dart';
import '../../view_model/fetch_login_revirpoid.dart';
import '../../view_model/fetch_user_revirpoid.dart';
import 'custom_button_widget.dart';
import 'google_button.dart';
import 'signup_widget.dart';
import 'text_form_custom.dart';
import 'text_form_password.dart';
import 'title_widget.dart';

class BodyLoginWidget extends StatelessWidget {
  BodyLoginWidget({Key? key}) : super(key: key);
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return    Form(
      key: _formKey,
      child: SafeArea(child: Column(
        children: [
          Expanded(
            child:SizedBox(
              width: MediaQuery.of(context).size.width,
              child:  Card(

                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children:  [
                        const TitleWidget(),
                        TextFromCustom(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please Enter Email';
                            }
                          },
                          controller: emailController,
                          hintText: 'Email',

                        ),
                        const SizedBox(height: 20,),
                        TextFromPasswordCustom(

                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please Enter Password';
                            }
                          },
                          controller: passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20,),
                       Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                         final login=ref.watch(fetchLoginRevirpoid);
                         final profile=ref.watch(fetchUserReviripoid);
                         final getCart=ref.watch(fetchGetCartRevirpoid);
                         final getFavorite=ref.watch(fetchGetFavoriteRevirpoid);
                         final getAddress=ref.watch(fetchGetAddressRevirpoid);
                         final getPayment=ref.watch(fetchGetVisaRevirpoid);

                         return  CustomButtonWidget(
                           color: ColorsApp.foucesColor,
                           minWidth: MediaQuery.of(context).size.width/1.2,
                           onPressed: (){
                             if(_formKey.currentState!.validate()){
                               login.getData(
                                 context: context,
                                 token: Strings.myToken,
                                 email: emailController.text,
                                 password: passwordController.text
                               ).then((value) {
                                 profile.getData();
                                 getCart.getData();
                                 getFavorite.getData();
                                 getAddress.getData();
                                 getPayment.getData();
                               });


                             }

                           },
                           title:  Text('Login',style: Styles.textStyle16.copyWith(
                               color: Colors.white
                           ),),
                         );
                       },),
                        const SizedBox(height: 20,),
                        const  Text('OR'
                            ,style: Styles.textStyle14),
                        const SizedBox(height: 10,),
                        const GoogleButtonWidget(),
                        const SizedBox(height: 20,),
                        const SignUPWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )

        ],
      )),
    ) ;

  }
}
