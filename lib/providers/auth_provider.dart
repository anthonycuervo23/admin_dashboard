import 'dart:async';
import 'package:flutter/material.dart';

//My imports
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/api/models/http/auth_response.dart';
import 'package:admin_dashboard/api/models/user.dart';
import 'package:admin_dashboard/router/routes.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    final data = {'correo': email, 'password': password};

    //HTTP Request
    CafeApi.httpPost('/auth/login', data).then((json) {
      final AuthResponse authResponse = AuthResponse.fromJson(json);

      //save current user
      user = authResponse.usuario;

      //Save the token to the local storage
      LocalStorage.prefs.setString('token', authResponse.token);
      authStatus = AuthStatus.authenticated;

      //Open Dashboard
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      //Update dio with the new JWT
      CafeApi.configureDio();

      //notify UI for all the changes
      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackBarError('User / Password Invalid');
    });
  }

  register(String name, String email, String password) {
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };
    //HTTP POST Request
    CafeApi.httpPost('/usuarios', data).then((json) {
      final AuthResponse authResponse = AuthResponse.fromJson(json);

      //save current user
      user = authResponse.usuario;

      //Save the token to the local storage
      LocalStorage.prefs.setString('token', authResponse.token);
      authStatus = AuthStatus.authenticated;

      //Open Dashboard
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      //Update dio with the new JWT
      CafeApi.configureDio();

      //notify UI for all the changes
      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackBarError('User / Password Invalid');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    //Check if JWT is null
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    //Check if JWT is valid
    try {
      final resp = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromJson(resp);

      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
