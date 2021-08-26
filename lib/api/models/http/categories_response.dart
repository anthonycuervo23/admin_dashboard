import 'dart:convert';

import 'package:admin_dashboard/api/models/category.dart';

CategoryResponse categoryResponseFromJson(String str) =>
    CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) =>
    json.encode(data.toJson());

class CategoryResponse {
  CategoryResponse({
    required this.total,
    required this.categorias,
  });

  int total;
  List<Categoria> categorias;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        total: json["total"],
        categorias: List<Categoria>.from(
            json["categorias"].map((x) => Categoria.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toJson())),
      };
}
