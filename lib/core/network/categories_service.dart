import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/categories_model.dart';

class CategoriesService {
  String categoriesURL = "https://www.themealdb.com/api/json/v1/1/categories.php";

  Future<CategoryModel> getCategories() async {
    try {
      final apiRespons = await http.get(categoriesURL);

      if (apiRespons.statusCode == 200){
        Map jsonObject = jsonDecode(apiRespons.body);
        CategoryModel categoriesModel = CategoryModel.fromJson(jsonObject);
        return categoriesModel;

      } else {
        print("Failed to load Categories Object");
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
}