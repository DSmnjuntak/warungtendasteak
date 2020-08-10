import 'package:flutter/material.dart';

import '../core/model/categories_model.dart';
import '../core/network/categories_service.dart';

void main() {
  runApp(MyWTS());
}

class MyWTS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  String name = "Dessert";
//  String desc = """
//                  Dessert is a course that concludes a meal. The course usually consists of sweet foods, such as confections dishes or fruit, and possibly a beverage such as dessert wine or liqueur, however in the United States it may include coffee, cheeses, nuts, or other savory items regarded as a separate course elsewhere. In some parts of the world, such as much of central and western Africa, and most parts of China, there is no tradition of a dessert course to conclude a meal.\r\n\r\n The term dessert can apply to many confections, such as biscuits, cakes, cookies, custards, gelatins, ice creams, pastries, pies, puddings, and sweet soups, and tarts. Fruit is also commonly found in dessert courses because of its naturally occurring sweetness. Some cultures sweeten foods that are more commonly savory to create desserts.
//                  """;
//  String url = null;

  Widget card(BuildContext context, String name, String desc, String url) {
    var textSpan = TextSpan(text: desc);

    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                borderRadius: BorderRadius.circular(100),
                child: (url == null)
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100)),
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        child: Image(image: NetworkImage(url))),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Text.rich(
                      textSpan,
                      // desc,
                      textAlign: TextAlign.justify,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CategoriesService _service;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service = CategoriesService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CategoryModel>(
        future: _service.getCategories(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var response = snapshot.data.categories;
              return ListView.separated(
                itemCount: response.length,
                addAutomaticKeepAlives: true,
                scrollDirection: Axis.vertical,
                reverse: false,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.white,
                  height: 0,
                ),
                itemBuilder: (context, index) {

                  var data = response[index];
                  return card(context, data.strCategory, data.strCategoryDescription, data.strCategoryThumb);
                },
              );
            } else {
              return Center(
                child: Text("Data not found!"),
              );
            }
          } else {
            return Center(
              child: Text('Loading...'),
            );
          }
        },
      ),
    );
  }
}
