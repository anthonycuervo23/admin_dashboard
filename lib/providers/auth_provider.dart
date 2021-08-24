import 'dart:async';

import 'package:admin_dashboard/router/routes.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    //HTTP Request
    _token = 'afrvc32rffbsa.asfsgasdfsg.afgeas';

    //Save the token to the local storage
    LocalStorage.prefs.setString('token', _token!);
    authStatus = AuthStatus.authenticated;

    //Open Dashboard

    notifyListeners();
    NavigationService.navigateTo(Flurorouter.dashboardRoute);
    //isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    //Check if JWT is valid
    authStatus = AuthStatus.authenticated;
    await Future.delayed(Duration(milliseconds: 3000));
    notifyListeners();
    return true;
  }
}
