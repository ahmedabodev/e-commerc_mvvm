import 'package:e_commerc_mvvm_revirpoid/core/utils/assets.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:e_commerc_mvvm_revirpoid/core/widgets/imagefile.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/widgets/custom_button_widget.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view_model/fetch_signin_revirpoid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'custom_feild_phone.dart';
import 'signin_widget.dart';
import 'text_form_custom.dart';
import 'text_form_password.dart';

class BodySignInWidget extends StatelessWidget {
  BodySignInWidget({Key? key}) : super(key: key);
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
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
                        const SizedBox(height: 15,),

                        Text('Register',style: Styles.textStyle30.copyWith(
                        ),),
                        const SizedBox(height: 30,),
                        CameraScreen(),
                        const SizedBox(height: 20,),

                        TextFromCustom(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please Enter Username';
                            }
                          },
                          controller: usernameController,
                          hintText: 'Username',

                        ),
                        const SizedBox(height: 20,),
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
                        TextFromPhone(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please Enter PhoneNumber';
                            }
                          },
                          controller: phoneController,
                          hintText: 'Phone',

                        ),
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
                        final signin=ref.watch(fetchSignInRevirpoid);
                        return   CustomButtonWidget(
                          color: ColorsApp.foucesColor,
                          minWidth: MediaQuery.of(context).size.width/1.2,
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              signin.getData(
                                photo:(Strings.photo==null)?null: Strings.photo,
                                password: passwordController.text,
                                email: emailController.text,
                                name:usernameController.text,
                                phone:phoneController.text,
                                rules: 'user',
                                token: Strings.myToken,
                                context: context
                              );

                            }

                          },
                          title:  Text('Register ',style: Styles.textStyle16.copyWith(
                              color: Colors.white
                          ),),
                        );
                      },),
                        const SizedBox(height: 20,),
                        const SignInWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
