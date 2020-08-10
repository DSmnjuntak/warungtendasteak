import 'dart:convert';

import 'package:warungtendasteak/core/model/categories_model.dart';
import 'package:http/http.dart' as http;

class categoriesService {
  String categoriesURL = "https://www.themealdb.com/api/json/v1/1/categories.php";

  Future<CategoriesModel> getCategories() async {
    try {
      final apiRespons = await http.get(categoriesURL);

      if (apiRespons.statusCode == 200){
        Map jsonObject = jsonDecode(apiRespons.body);
        CategoriesModel categoriesModel = CategoriesModel.fromJson(jsonObject);
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