import 'dart:convert';

import 'package:admin_dashboard/api/models/user.dart';

CustomersResponse customersResponseFromJson(String str) =>
    CustomersResponse.fromJson(json.decode(str));

String customersResponseToJson(CustomersResponse data) =>
    json.encode(data.toJson());

class CustomersResponse {
  CustomersResponse({
    required this.total,
    required this.usuarios,
  });

  int total;
  List<Usuario> usuarios;

  factory CustomersResponse.fromJson(Map<String, dynamic> json) =>
      CustomersResponse(
        total: json["total"],
        usuarios: List<Usuario>.from(
            json["usuarios"].map((x) => Usuario.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
      };
}
