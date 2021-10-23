import 'package:flutter/material.dart';

//My Imports
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/api/models/category.dart';
import 'package:admin_dashboard/api/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];

  Future<void> getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResp = CategoryResponse.fromJson(resp);

    categories = categoriesResp.categorias;
    print(categories);
    notifyListeners();
  }

  Future<void> newCategory(String name) async {
    final data = {
      'nombre': name,
    };

    try {
      //POST request to create a new category
      final json = await CafeApi.httpPost('/categorias', data);

      //Save the category we created in a variable
      final newCategory = Categoria.fromJson(json);

      //Add the new category in our list of categories
      categories.add(newCategory);

      //Notify UI for changes to display the new category
      notifyListeners();
    } catch (e) {
      throw 'Error creating a new category';
    }
  }

  Future<void> updateCategory(String name, String id) async {
    final data = {
      'nombre': name,
    };

    try {
      await CafeApi.httpPut('/categorias/$id', data);

      categories = categories.map((category) {
        if (category.id != id) return category;
        category.nombre = name;
        return category;
      }).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await CafeApi.httpDelete('/categorias/$id', {});
      categories.removeWhere((category) => category.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
