
import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFromCustom extends StatelessWidget {
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? hintText;
  bool? length=false;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      maxLength: (length==true)?11:null,
      controller: controller,
      validator: validator,
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

  TextFromCustom({
    this.controller,
    this.validator,
    this.length,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
  });
}
