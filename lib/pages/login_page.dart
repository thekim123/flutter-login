import 'package:flutter/material.dart';
import 'package:flutter_login/components/Logo.dart';
import 'package:flutter_login/components/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Logo("Login"),
            CustomTextFormField(),
          ],
        ),
      ),
    );
  }
}

