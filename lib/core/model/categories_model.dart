import 'dart:convert';

CategoriesModel categoriesFromJSON(String string) => CategoriesModel.fromJson(json.decode(string));
String categoriesModelToJSON(CategoriesModel data) => json.encode(data.toJSON());

class CatergoriesModel {
  List<Categories> categories;

  CatergoriesModel({
    this.categories,
  });

  factory CatergoriesModel.fromJson(Map<String, dynamic> json) => CatergoriesModel(
    categories: List<Categories>.from(json["categories"].map((value) => Categories.fromJson((value))));
  );

  Map<String, dynamic> toJSON() => {
    "categories" : List<Categories>.from(categories.map((e) => e.toJSON())),
  };
}

class Categories {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Categories({
    this.idCategory,
    this.strCategory,
    this.strCategoryDescription,
    this.strCategoryThumb,
  });

  factory Categories.fromJSON(Map<String, dynamic> json) => Categories(
    idCategory: json["idCategory"],
    strCategory: json["strCategory"],
    strCategoryDescription: json["strCategoryThumb"],
    strCategoryThumb: json["strCategoryDescription"],
  );
}