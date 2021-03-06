import 'dart:typed_data';
import 'package:flutter/material.dart';

//My imports
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/api/models/user.dart';

class CustomerFormProvider extends ChangeNotifier {
  late GlobalKey<FormState> formKey;

  Usuario? customer;

  //esasy way to update something specific
  //we can call this method in where we need to update
  // void updateListener() {
  //   notifyListeners();
  // }

  //we can also do a copy with to update a specific user value
  //calling at the end notifyListener
  // we are using this in customer_view.dart (name and email textfield)
  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    customer = new Usuario(
      rol: rol ?? this.customer!.rol,
      estado: estado ?? this.customer!.estado,
      google: google ?? this.customer!.google,
      nombre: nombre ?? this.customer!.nombre,
      correo: correo ?? this.customer!.correo,
      uid: uid ?? this.customer!.uid,
    );

    notifyListeners();
  }

  bool _validateForm() {
    if (formKey.currentState!.validate()) return true;
    return false;
  }

  Future<bool> updateUser() async {
    if (!_validateForm()) return false;

    final data = {
      'nombre': customer!.nombre,
      'correo': customer!.correo,
    };

    try {
      await CafeApi.httpPut('/usuarios/${customer!.uid}', data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Usuario> uploadImage(String uid, Uint8List bytes) async {
    try {
      final resp =
          await CafeApi.httpUploadFile('/uploads/usuarios/$uid', bytes);

      //update customer with the new updated file
      customer = Usuario.fromJson(resp);
      notifyListeners();

      return customer!;
    } catch (e) {
      print(e);
      throw 'Error in Customer Form Provider';
    }
  }
}
