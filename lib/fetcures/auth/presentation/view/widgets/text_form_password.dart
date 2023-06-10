import 'package:e_commerc_mvvm_revirpoid/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFromPasswordCustom extends StatefulWidget {
  TextEditingController? controller;
  bool obscureText = false;
  ValueChanged<String>? onSubmitted;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? label;
  String? hintText;

  @override
  State<TextFromPasswordCustom> createState() => _TextFromPasswordCustomState();

  TextFromPasswordCustom({
    this.controller,
    required this.obscureText,
    this.onSubmitted,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
  });
}

class _TextFromPasswordCustomState extends State<TextFromPasswordCustom> {

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      decoration:  InputDecoration(
        isDense: true,
        hintText: 'password',
        enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            )
        ),
        focusedBorder:  const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorsApp.foucesColor,

            )
        ),
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              widget.obscureText = !widget.obscureText;
            });

          }, icon: widget.obscureText ?  const Icon(Icons.visibility):const Icon(Icons.visibility_off) ,
        ),
        prefixIcon: widget.prefixIcon,


      ),

    );

  }
}