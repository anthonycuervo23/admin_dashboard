import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  bool validateForm() {
    if (formKey.currentState!.validate()) return true;
    return false;
  }
}
