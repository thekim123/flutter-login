import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

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
          CustomTextFormField(text: "Email",
                  mValid: (value){
            if(value == null || value.isEmpty){
              return "Please enter some text";
            } else if(!isEmail(value)){
              return "email 형식이 아닙니다.";
            } else {
              return null;
            }
          }),
          SizedBox(height: medium_gap,),
          CustomTextFormField(
            text: "Password",
            mValid: (value){
              if(value == null || value.isEmpty){
                return "Please enter some text";
              } else if(value.toString().length > 20) {
                return "Too long password.";
              } else{
                return null;
              }
            },),
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
