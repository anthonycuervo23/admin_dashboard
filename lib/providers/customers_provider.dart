import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/api/models/http/customers_response.dart';
import 'package:admin_dashboard/api/models/user.dart';
import 'package:flutter/material.dart';

class CustomersProvider extends ChangeNotifier {
  List<Usuario> customers = [];
  bool isLoading = true;
  bool isAscending = true;
  int? sortColumnIndex;

  CustomersProvider() {
    getPaginatedUsers();
  }

  Future<void> getPaginatedUsers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');

    final usersResp = CustomersResponse.fromJson(resp);

    customers = [...usersResp.usuarios];

    isLoading = false;

    notifyListeners();
  }

  Future<Usuario?> getUserById(String uid) async {
    try {
      final resp = await CafeApi.httpGet('/usuarios/$uid');

      final customer = Usuario.fromJson(resp);

      return customer;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void sort<T>(Comparable<T> Function(Usuario customer) getField) {
    customers.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return isAscending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    isAscending = !isAscending;

    notifyListeners();
  }

  void refreshCustomer(Usuario newCustomer) {
    try {
      customers = customers.map<Usuario>((Usuario customer) {
        if (customer.uid != newCustomer.uid) return customer;
        customer.nombre = newCustomer.nombre;
        customer.correo = newCustomer.correo;
        return customer;
      }).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
