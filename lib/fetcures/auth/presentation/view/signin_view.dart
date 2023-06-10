import 'package:e_commerc_mvvm_revirpoid/config/routes/app_routs.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/assets.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:e_commerc_mvvm_revirpoid/core/widgets/imagefile.dart';
import 'package:e_commerc_mvvm_revirpoid/fetcures/auth/presentation/view/widgets/body_signin_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/style.dart';
import 'widgets/custom_button_widget.dart';
import 'widgets/signup_widget.dart';
import 'widgets/text_form_custom.dart';
import 'widgets/text_form_password.dart';
import 'widgets/title_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:BodySignInWidget(),
    );
  }
}


