import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String text;

  const CustomTextFormField({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$text"),
        TextFormField(
          validator: (value){
            if(value == null || value.isEmpty){
              return "Please enter some text";
            } else {
              return null;
            }

            //value!.isEmpty ? "Please enter some text" : null
          } ,
            obscureText: text == "Password" ? true : false,
            decoration: InputDecoration(
              hintText: "Enter $text",
              enabledBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(20),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(20),
              ),
            ),
        ),
      ],
    );
  }
}
