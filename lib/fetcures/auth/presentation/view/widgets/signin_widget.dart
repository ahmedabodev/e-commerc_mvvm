import 'package:e_commerc_mvvm_revirpoid/config/routes/app_routs.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:flutter/material.dart';

class SignInWidget extends StatelessWidget {

  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('have an account?',style: Styles.textStyle16,),
        TextButton(
          onPressed: (){
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
          }, child:  Text('Login',style: Styles.textStyle16.copyWith(
            color: ColorsApp.textButtonColor
        ),),

        ),
      ],
    );
  }
}
