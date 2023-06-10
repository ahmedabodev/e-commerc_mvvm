import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFromPhone extends StatelessWidget {
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(

      controller: controller,
      validator: validator,
      maxLength:11,

      keyboardType:TextInputType.phone,
      decoration:  InputDecoration(
        isDense: true,

        hintText: hintText,
        enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            )
        ),
        focusedBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorsApp.foucesColor,

            )
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );

  }

  TextFromPhone({
    this.controller,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
  });
}
