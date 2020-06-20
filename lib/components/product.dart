import 'package:flutter/material.dart';
import 'package:posapp/api/user_api.dart';
import 'package:posapp/notifier/product_notifier.dart';
import 'package:posapp/pages/page_products_details.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
//  @override
//  void initState() {
//    ProductNotifier productNotifier =
//        Provider.of<ProductNotifier>(context, listen: false);
//    getProducts(productNotifier);
//    super.initState();
//  }

//  var product_list = [
//    {
//      "name": "Fanta",
//      "picture": "images/products/fanta01.jpg",
//      "price": 10,
//      "quantity": 5,
//    },
//  ];

  @override
  Widget build(BuildContext context) {}
}

//class Single_prod extends StatelessWidget {
//  final prod_name;
//  final prod_picture;
//  final prod_price;
//  final prod_quantity;
//
//  Single_prod({
//    this.prod_name,
//    this.prod_picture,
//    this.prod_price,
//    this.prod_quantity,
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      child: Hero(
//        tag: new Text("hero 1"),
//        child: Material(
//          child: InkWell(
//            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                builder: (context) => new ProductsDetailsPage(
//                      product_detail_name: prod_name,
//                      product_detail_picture: prod_picture,
//                      product_detail_price: prod_price,
//                      product_detail_quantity: prod_quantity,
//                    ))),
//            child: GridTile(
//              footer: Container(
//                color: Colors.white70,
//                child: ListTile(
//                  leading: Text(
//                    prod_name,
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  ),
//                  title: Text(
//                    "ราคา " + "$prod_price\฿",
//                    style: TextStyle(fontWeight: FontWeight.w800),
//                  ),
//                  subtitle: Text(
//                    "คงเหลือ " + "$prod_quantity",
//                    style: TextStyle(
//                        color: Colors.red, fontWeight: FontWeight.w800),
//                  ),
//                ),
//              ),
//              child: Image.asset(
//                prod_picture,
//                fit: BoxFit.cover,
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
