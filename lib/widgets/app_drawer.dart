import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/screen/product_list_category_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  void onPressedFunc(ctx, category) {
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
              return ProductListCategoryScreen(category);
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
                      onPressedFunc(context, "LUXOR CHAIR");
                    },
                  ),
                  ListTile(
                    title: Text("Executive Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Office Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Staff Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Visitor Chair"),
                    onTap: () {},
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
                      onPressedFunc(context, "SUPREME FURNITURE");
                    },
                  ),
                  ListTile(
                    title: Text("Executive Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Office Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Staff Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Visitor Chair"),
                    onTap: () {},
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
                      onPressedFunc(context, "ART DECO-PVC TILES");
                    },
                  ),
                  ListTile(
                    title: Text("Executive Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Office Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Staff Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Visitor Chair"),
                    onTap: () {},
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
                      onPressedFunc(context, "FLOOR MAX -LAMINATE");
                    },
                  ),
                  ListTile(
                    title: Text("Executive Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Office Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Staff Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Visitor Chair"),
                    onTap: () {},
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
                      onPressedFunc(context, "DECO FLOOR PVC TILES");
                    },
                  ),
                  ListTile(
                    title: Text("Executive Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Office Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Staff Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Visitor Chair"),
                    onTap: () {},
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
                      onPressedFunc(context, "GRASSIA- ARTIFICIAL GRASS");
                    },
                  ),
                  ListTile(
                    title: Text("Executive Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Office Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Staff Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Visitor Chair"),
                    onTap: () {},
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
                      onPressedFunc(context, "PVC FLOORING");
                    },
                  ),
                  ListTile(
                    title: Text("Executive Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Office Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Staff Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Visitor Chair"),
                    onTap: () {},
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
                      onPressedFunc(context, "KALEEN RUGS");
                    },
                  ),
                  ListTile(
                    title: Text("Executive Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Office Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Staff Chair"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Visitor Chair"),
                    onTap: () {},
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
