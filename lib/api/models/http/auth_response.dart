import 'dart:convert';

//My imports
import 'package:admin_dashboard/api/models/user.dart';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    required this.usuario,
    required this.token,
  });

  Usuario usuario;
  String token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
        "token": token,
      };
}
