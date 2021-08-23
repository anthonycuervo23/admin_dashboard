import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form Validated');
    } else {
      print('Form not valid');
    }
  }
}
