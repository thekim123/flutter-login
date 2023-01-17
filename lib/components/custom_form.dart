import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size.dart';
import 'custom_text_form_field.dart';

class CustomForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(text: "Email",),
          SizedBox(height: medium_gap,),
          CustomTextFormField(text: "Password"),
          SizedBox(height: large_gap,),
          TextButton(
            onPressed: (){
              // 유효성 검사 성공 -> return true, 실패 -> return false
              if(_formKey.currentState!.validate()){
                Navigator.pushNamed(context, "/home");
              }

            }, child: Text("Login"),)
        ],
      ),
    );
  }
}
