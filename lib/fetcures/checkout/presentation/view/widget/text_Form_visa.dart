import 'package:e_commerc_mvvm_revirpoid/fetcures/checkout/presentation/view/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'card_Input_formatter.dart';
import 'card_month_input_formetter.dart';

class TextFormVisa extends StatelessWidget {
  dynamic controller;
  dynamic validator;
  String label;
  int length;
  int split;
  bool num=false;
  bool? data=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        validator:validator ,
        maxLength:(num==true)?length: null,
        controller:controller ,
        inputFormatters:(num==false)?null: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(split),
          (data==true)?CardMonthInputFormatter(): CardNumberInputFormatter(),
        ],

        keyboardType:(num==true)?TextInputType.number:TextInputType.text,
        decoration:  InputDecoration(
            focusColor: Colors.white,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 5,
                    color: Colors.black

                )
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey

                )
            ),
            labelText: label,

            labelStyle: const TextStyle(
                color: Colors.grey
            )
        ),
      ),
    );
  }

  TextFormVisa({
    required this.controller,
    required this.label,
    this.data,
    required this.split,
    required this.length,
    required this.num,
    required this.validator,
  });
}
