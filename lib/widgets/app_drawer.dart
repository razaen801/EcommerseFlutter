import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/screen/product_list_category_screen.dart';
import 'package:rohi_furniture_app/screen/product_sub_category_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  void onPressedFunc(ctx, categoryName, categoryID) {
    // Navigator.pushNamed(ctx,ProductListCategoryScreen.routeId,
    //     arguments: category,);
    Navigator.push(
        ctx,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 300),
            transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
              var begin = Offset(1, 0.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return ProductListCategoryScreen(categoryName, categoryID);
            }));
  }

  //launch subcategory view
  void onPressedSubCategory(ctx, categoryName, categoryId, categorySubId) {
    // Navigator.pushNamed(ctx,ProductListCategoryScreen.routeId,
    //     arguments: category,);
    Navigator.push(
        ctx,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 300),
            transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
              var begin = Offset(1, 0.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return ProductSubCategoryScreen(
                  categoryName, categoryId, categorySubId);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      child: Drawer(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(77, 93, 92, 1),
                ),
                padding: EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Text("CATEGORIES",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      )),
                ),
              ),
              ExpansionTile(
                title: Text("LUXOR CHAIR"),
                children: [
                  ListTile(
                    title: Text("Show LUXOR CHAIR"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedFunc(context, "LUXOR CHAIR", 1);
                    },
                  ),
                  ListTile(
                    title: Text("Executive Chair"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Executive Chair", 1, 1);
                    },
                  ),
                  ListTile(
                    title: Text("Office Chair"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Office Chair", 1, 2);
                    },
                  ),
                  ListTile(
                    title: Text("Staff Chair"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Staff Chair", 1, 3);
                    },
                  ),
                  ListTile(
                    title: Text("Visitor Chair"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Visitor Chair", 1, 4);
                    },
                  ),
                ],
              ),
              Divider(),
              ExpansionTile(
                title: Text("SUPREME FURNITURE"),
                children: [
                  ListTile(
                    title: Text("SUPREME FURNITURE"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedFunc(context, "SUPREME FURNITURE", 2);
                    },
                  ),
                  ListTile(
                    title: Text("Premium Chair with Arms"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(
                          context, "Premium Chair with Arms", 2, 14);
                    },
                  ),
                  ListTile(
                    title: Text("Premium Chair without Arms"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(
                          context, "Premium Chair without Arms", 2, 15);
                    },
                  ),
                  ListTile(
                    title: Text("Dining table"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Dining table", 2, 16);
                    },
                  ),
                  ListTile(
                    title: Text("Folding Table & chairs"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(
                          context, "Folding Table & chairs", 2, 17);
                    },
                  ),
                  ListTile(
                    title: Text("Sofa"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Sofa", 2, 18);
                    },
                  ),
                  ListTile(
                    title: Text("Kids collection"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Kids collection", 2, 19);
                    },
                  ),
                  ListTile(
                    title: Text("Center Table"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Center Table", 2, 20);
                    },
                  ),
                ],
              ),
              Divider(),
              ExpansionTile(
                title: Text("ART DECO-PVC TILES"),
                children: [
                  ListTile(
                    title: Text("ART DECO-PVC TILES"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedFunc(context, "ART DECO-PVC TILES", 3);
                    },
                  ),
                  ListTile(
                    title: Text("Korean Vinyl Tiles"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(
                          context, "Korean Vinyl Tiles", 3, 21);
                    },
                  ),
                ],
              ),
              Divider(),
              ExpansionTile(
                title: Text("FLOOR MAX -LAMINATE"),
                children: [
                  ListTile(
                    title: Text("FLOOR MAX -LAMINATE"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedFunc(context, "FLOOR MAX -LAMINATE", 4);
                    },
                  ),
                  ListTile(
                    title: Text("Laminate Flooring"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Laminate Flooring", 4, 11);
                    },
                  ),
                ],
              ),
              Divider(),
              ExpansionTile(
                title: Text("DECO FLOOR PVC TILES"),
                children: [
                  ListTile(
                    title: Text("DECO FLOOR PVC TILES"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedFunc(context, "DECO FLOOR PVC TILES", 5);
                    },
                  ),
                  ListTile(
                    title: Text("Deco Flooring"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Deco Flooring", 5, 23);
                    },
                  ),
                ],
              ),
              Divider(),
              ExpansionTile(
                title: Text("GRASSIA- ARTIFICIAL GRASS"),
                children: [
                  ListTile(
                    title: Text("GRASSIA- ARTIFICIAL GRASS"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedFunc(context, "GRASSIA- ARTIFICIAL GRASS", 6);
                    },
                  ),
                  ListTile(
                    title: Text("CC Grass"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "CC Grass", 6, 13);
                    },
                  ),
                ],
              ),
              Divider(),
              ExpansionTile(
                title: Text("PVC FLOORING"),
                children: [
                  ListTile(
                    title: Text("PVC FLOORING"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedFunc(context, "PVC FLOORING", 7);
                    },
                  ),
                  ListTile(
                    title: Text("Mini Calio 6.5ft"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "Mini Calio 6.5ft", 7, 12);
                    },
                  ),
                ],
              ),
              Divider(),
              ExpansionTile(
                title: Text("KALEEN RUGS"),
                children: [
                  ListTile(
                    title: Text("KALEEN RUGS"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedFunc(context, "KALEEN RUGS", 8);
                    },
                  ),
                  ListTile(
                    title: Text("H3620"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "H3620", 8, 6);
                    },
                  ),
                  ListTile(
                    title: Text("H3381"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "H3381", 8, 8);
                    },
                  ),
                  ListTile(
                    title: Text("H3384"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "H3384", 8, 9);
                    },
                  ),
                  ListTile(
                    title: Text("H3380"),
                    onTap: () {
                      Navigator.pop(context);
                      onPressedSubCategory(context, "H3380", 8, 10);
                    },
                  ),
                ],
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
