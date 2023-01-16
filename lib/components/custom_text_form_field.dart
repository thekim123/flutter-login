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
            obscureText: text == "Password" ? true : false,
            decoration: InputDecoration(
              hintText: "Enter $text",
              enabledBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(20),
              )

          ),
        ),
      ],
    );
  }
}
