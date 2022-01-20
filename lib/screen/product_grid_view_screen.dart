import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rohi_furniture_app/SharedPreferencesConfig.dart';
import 'package:rohi_furniture_app/provider/cart_provider.dart';
import 'package:rohi_furniture_app/provider/localProduct.dart';
import 'package:rohi_furniture_app/provider/product_provider.dart';
import 'package:rohi_furniture_app/screen/cart_list_screen.dart';
import 'package:rohi_furniture_app/screen/product_detail_screen.dart';
import 'package:rohi_furniture_app/widgets/app_drawer.dart';
import 'package:rohi_furniture_app/widgets/badge.dart';
import 'package:rohi_furniture_app/widgets/product_grid_view.dart';

// ignore: must_be_immutable
class ProductGridViewScreen extends StatefulWidget {
  @override
  _ProductGridViewScreenState createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text("Products");
  bool isLoggedin = false;
  
  Future checkLog() async{
    bool result = await SharedPreferenceConfig.getIsLoggedIn();
    setState(() {
      isLoggedin = result;
    });
  }


  void showToastMessage(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.blue,
        backgroundColor: Colors.white);
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ProductProvider>(context, listen: false)
          .getProductFromDB(),
      builder: (ctx, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: customSearchBar,
                  backgroundColor: Color.fromRGBO(77, 93, 92, 1),
                  actions: [
                    Consumer<Cart>(
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, CartListScreen.routeId);
                        },
                      ),
                      builder: (_, cart, child) {
                        return Badge(
                          child: child,
                          value: cart.itemCount.toString(),
                        );
                      },
                    ),
                  ],
                ),
                body: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Center(
                    child: Text(
                      "Loading...",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
                drawer: AppDrawer(),
              )
            : Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: customSearchBar,
                  backgroundColor: Color.fromRGBO(77, 93, 92, 1),
                  actions: [
                    IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: ProductSearch());
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    Consumer<Cart>(
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.white,
                        onPressed: () {
                          checkLog();
                          if(isLoggedin){
                            Navigator.pushNamed(context, CartListScreen.routeId);
                          }
                          else showToastMessage("Please login to continue");
                        },
                      ),
                      builder: (_, cart, child) {
                        return Badge(
                          child: child,
                          value: cart.itemCount.toString(),
                        );
                      },
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: snapshot.hasError
                      ? Center(child: Text("Sorry no products available!"))
                      : ProductGridView(
                          category: 100,
                        ),
                ),
                drawer: AppDrawer(),
              );
      },
    );
  }
}

class ProductSearch extends SearchDelegate<ProductProvider> {


  @override
  List<Widget> buildActions(BuildContext context) {
    //  implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // implement buildSuggestions
    final products =
        Provider.of<ProductProvider>(context, listen: false).products;
    final hintProducts = [
      products[5],
      products[11],
      products[22]
      // products[29],
      // products[50]
    ];

    List<LocalProduct> suggestionList = query.isEmpty
        ? hintProducts
        : products
            .where((element) => element.productName.startsWith(query))
            .toList();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.pushReplacementNamed(context, ProductDetailScreen.routeId,
                arguments: suggestionList[index].id);
          },
          leading: CachedNetworkImage(
            imageUrl: "https://rohiint.com${suggestionList[index].imageName}",
            fit: BoxFit.cover,
            placeholder: (context, url) => Padding(
              padding: const EdgeInsets.all(50.0),
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
            errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsets.all(50.0),
              child: Icon(Icons.error),
            ),
          ),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index]
                    .productName
                    .substring(0, query.length),
                style: TextStyle(
                    color: Color.fromRGBO(77, 93, 92, 1),
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionList[index]
                          .productName
                          .substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ]),
          ),
        ),
      ),
    );
  }
}
