import 'package:flutter/material.dart';
import 'package:warungtendasteak/ui/detailscreen.dart';

import '../core/model/categories_model.dart';
import '../core/network/categories_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoriesService _service;
  int _selectedIndex = 0;
  int currentIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _service = CategoriesService();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.amber,
            flexibleSpace: Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "Warung Tenda Steak",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
          )),
      body: FutureBuilder<CategoryModel>(
        future: _service.getCategories(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var response = snapshot.data.categories;
              return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.white,
                        height: 0,
                      ),
                  itemCount: response.length,
                  itemBuilder: (context, index) {
                    var data = response[index];
//                return Card();
                    return Container(
                      // height: MediaQuery.of(context).size.height * 0.2,
                      margin:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
                      child: InkWell(
                        splashColor: Colors.amber,
                        child: Card(
                          elevation: 2,
                          shadowColor: Colors.white70,
                          child: ListTile(
                            title: Text(data.strCategory),
                            subtitle: Text(
                              data.strCategoryDescription,
                              maxLines: 3,
                            ),
                            leading: Image.network(data.strCategoryThumb),
                            onTap: () {
                              print("${data.strCategory} is clicked");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailScreen(),
                                  settings: RouteSettings(
                                    arguments: response[index],
                                  )));
                            },
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text("Data not found!"),
              );
            }
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   child: Image.asset("images/logo.png"),
                  // ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                    "Splash Screen",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 1,
                  )
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            title: Text('Recipe'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            title: Text('Filter'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: MediaQuery.of(context).size.height * 0.08,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         MaterialButton(
      //           minWidth: MediaQuery.of(context).size.width * 0.25,
      //           onPressed: () {
      //             setState(() {
      //               currentIndex = 0;
      //               // currentScreen = HomePage();
      //             });
      //           },
      //           hoverColor: Colors.amberAccent,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Icon(
      //                 Icons.home,
      //                 color:
      //                     currentIndex == 0 ? Colors.amber : Colors.grey[300],
      //               ),
      //               Text(
      //                 'Home',
      //                 style: TextStyle(
      //                   color:
      //                       currentIndex == 0 ? Colors.amber : Colors.grey[300],
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //         MaterialButton(
      //           minWidth: MediaQuery.of(context).size.width * 0.25,
      //           onPressed: () {
      //             setState(() {
      //               currentIndex = 1;
      //               // currentScreen = RecipePage();
      //             });
      //           },
      //           hoverColor: Colors.amberAccent,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Icon(
      //                 Icons.home,
      //                 color:
      //                     currentIndex == 1 ? Colors.amber : Colors.grey[300],
      //               ),
      //               Text(
      //                 'Home',
      //                 style: TextStyle(
      //                   color:
      //                       currentIndex == 1 ? Colors.amber : Colors.grey[300],
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
