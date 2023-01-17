import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String text;
  final mValid;

  const CustomTextFormField({required this.text, required this.mValid});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$text"),
        TextFormField(
          validator: mValid,
            //value!.isEmpty ? "Please enter some text" : null

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
