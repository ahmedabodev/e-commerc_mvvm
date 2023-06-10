import 'package:e_commerc_mvvm_revirpoid/core/utils/style.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Text('Your Store',style: Styles.textStyle30.copyWith(
        ),),
        const SizedBox(height: 20,),

        const Text('Welcome',style: Styles.textStylemeduim),
        const SizedBox(height: 10,),
         Text('Sign up to get started and experience '
            ,style: Styles.textStyle12.copyWith(
              color: Colors.grey
            )),
        const  SizedBox(height: 10,),
          Text('great shopping deals '
            ,style: Styles.textStyle12.copyWith(
              color: Colors.grey
            )),
        const  SizedBox(height: 20,),
      ],
    );
  }
}
