import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/provider/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _productList = [
    Product(
        productId: "1",
        productImgUrl: "assets/Boss-HB.png",
        productDescription: "Executive chair with\n"
                             "Multi Locking Tilt Mechanism\n"
                              "Fiber Foam Cushion\n"
                              "Super Soft Reline",
        productName: "Boss-HB",
        productPrice: 31300.0,
        productCategory: "LUXOR CHAIR"),
    Product(
        productId: "2",
        productImgUrl: "assets/Zetta-HB.png",
        productDescription: "Executive Chair with \n"
                            "Ergonomic Design\n"
                            "Tilt Tension Control\n"
                            "Back Recline Locking\n"
                            "Seat Height Adjustment",
        productName: "Zetta-HB",
        productPrice: 19100.0,
        productCategory: "LUXOR CHAIR"),
    Product(
        productId: "3",
        productImgUrl: "assets/Star.png",
        productDescription: "Officer Chair with \n"
                            "Mesh Back,Chrome Base\n"
                            "PU Adjustment\n"
                            "Multi Locking Tilt Mechanism\n",
        productName: "Star Chair",
        productPrice: 11950.0,
        productCategory: "LUXOR CHAIR"),
    Product(
        productId: "4",
        productImgUrl: "assets/Palwa-HB.jpg",
        productDescription: "Executive Chair with\n"
                            "Synthetic Leather\n"
                            "Multi Tilt Mechanism\n"
                            "Imported Steel Base\n"
                            "Arm Rest",
        productName: "Palwa HB",
        productPrice: 28150.0,
        productCategory: "LUXOR CHAIR"),
    Product(
        productId: "5",
        productImgUrl: "assets/Kaleen-Carpet.jpg",
        productDescription: "Step into comfort.Accentuate look for your home\n"
                            "with attractive color and design. Symbol of luxury and elegance",
        productName: "Kallen Carpet",
        productPrice: 7500.0,
        productCategory: "KALLEEN RUGS"),
    Product(
        productId: "6",
        productImgUrl: "assets/carpet.jpg",
        productDescription: "Step into comfort.\n"
                            " Accentuate look for your home with attractive color and design.\n"
                            " Symbol of luxury and elegance.",
        productName: "Kallen Carpet",
        productPrice: 7500.0,
        productCategory: "KALLEEN RUGS"),
    Product(
        productId: "7",
        productImgUrl: "assets/amaze.jpg",
        productDescription: "Folding Table with\n"
                            "Centre Folding Bench-Blow Moulded Folding Bench",
        productName: "Amaze table",
        productPrice: 16200.0,
        productCategory: "SUPREME FURNITURE"),
    Product(
        productId: "8",
        productImgUrl: "assets/antik.jpg",
        productDescription: "Premium Chair without Arms",
        productName: "Antik Chair",
        productPrice: 3150.0,
        productCategory: "SUPREME FURNITURE"),
    Product(
        productId: "9",
        productImgUrl: "assets/astra.jpg",
        productDescription: "Center Table Trolley",
        productName: "Astra Table",
        productPrice: 3400.0,
        productCategory: "SUPREME FURNITURE"),
    Product(
        productId: "10",
        productImgUrl: "assets/Bed.jpg",
        productDescription: "Blow Moulded Bed",
        productName: "Resto Bed",
        productPrice: 19700.0,
        productCategory: "SUPREME FURNITURE"),
    Product(
        productId: "11",
        productImgUrl: "assets/bison.jpg",
        productDescription: "Premium Finish Heavy Duty Six Seater Dinning Table with\n"
                            "Extra Broad and Wide table top and Contemporary Style Solid Built Legs ",
        productName: "Bison Table",
        productPrice: 13500.0,
        productCategory: "SUPREME FURNITURE"),
    Product(
        productId: "12",
        productImgUrl: "assets/Saw-1013.jpg",
        productDescription: "Korean Vinyl Tiles\n"
                            "Wood surface deco vinyl floor 3mm fireproof waterproof tile pvc floor luxury vinyl plank floor",
        productName: "SAW-103",
        productPrice: 140.0,
        productCategory: "ART DECO-PVC TILES"),
    Product(
        productId: "13",
        productImgUrl: "assets/Saw-3053.jpg",
        productDescription: "Korean Vinyl Tiles\n"
                            "Wood surface deco vinyl floor 3mm fireproof waterproof tile pvc floor luxury vinyl plank floor",
        productName: "SAW-3053",
        productPrice: 140.0,
        productCategory: "ART DECO-PVC TILES"),
    Product(
        productId: "14",
        productImgUrl: "assets/DYH80020.jpg",
        productDescription: "It is designed to replicate the natural color, grain and texture of real hardwood. \n"
                            "Laminate is remarkably realistic and exceptionally durable -resistant to staining, scratches, wear and fading.\n"
                            " 1. Easy installation \n"
                            "2. cost effective \n"
                            "3. Good stain resistance",
        productName: "DYH80020",
        productPrice: 135.0,
        productCategory: "FLOOR MAX -LAMINATE"),
    Product(
        productId: "15",
        productImgUrl: "assets/DHY80385.jpg",
        productDescription: "It is designed to replicate the natural color, grain and texture of real hardwood. \n"
                            "Laminate is remarkably realistic and exceptionally durable -resistant to staining, scratches, wear and fading.\n "
                            "1. Easy installation \n"
                            "2. cost effective 3. Good stain resistance",
        productName: "DYH80385",
        productPrice: 135.0,
        productCategory: "FLOOR MAX -LAMINATE"),
    Product(
        productId: "16",
        productImgUrl: "assets/Artifical-Grass.jpg",
        productDescription: "1.Pile Height:-35 mm \n"
                            "2.Tuft Gauge:-3/8 inch \n"
                            "3.Stitch Rate:-18/10 CM \n"
                            "4.Material/Detex:-PE & PP 8300 \n"
                            "5.MAX UV defence \n"
                            "6.Cost Effective \n"
                            "7. Environment Friendly \n"
                            "8.Shorter Construction Period.",
        productName: "Artificial Grass",
        productPrice: 150.0,
        productCategory: "GRASSIA- ARTIFICIAL GRASS"),
    Product(
        productId: "17",
        productImgUrl: "assets/pvc-flooring-1.jpg",
        productDescription: "1.Width-79inch\n"
                            "2. 1 roll = 30 meter \n"
                            "3. it's surface is treated with a clear and transparent wear layer to protect its design and color.",
        productName: "MINI CALIO",
        productPrice: 13500.0,
        productCategory: "PVC FLOORING"),
    Product(
        productId: "18",
        productImgUrl: "assets/deco-1022.jpg",
        productDescription: "DECO Tile offers distinctive PVC plank designs with the realistic look of natural materials at a reasonable costs.\n"
                            " 1. high durability \n"
                            "2. reasonable price \n"
                            "3. water resistant",
        productName: "Deco Floor",
        productPrice: 135.0,
        productCategory: "DECO FLOOR PVC TILES"),
  ];

  // return list of all products
  List<Product> get products {
    return [..._productList];
  }

  //get product by id
  Product findById(String id) {
    return _productList.firstWhere((prod) {
      return prod.productId == id;
    });
  }

  //get product by category
  List<Product> findByCategory(String category) {
    return _productList.where((prod) {
      return prod.productCategory == category;
    }).toList();
  }

  //get favourite product
  List<Product> get favourites {
    return _productList.where((prodItem) {
      return prodItem.isFavourite;
    }).toList();
  }
}
