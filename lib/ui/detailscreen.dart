import 'package:flutter/material.dart';
import 'package:warungtendasteak/ui/homepage.dart';
import '../core/model/categories_model.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Card(
          elevation: 10,
          shadowColor: Colors.white,
          margin: EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.network(
                  category.strCategoryThumb,
                  cacheHeight: 100,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  category.strCategory,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  category.strCategoryDescription,
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
