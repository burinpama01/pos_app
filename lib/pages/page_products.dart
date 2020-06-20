import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:posapp/api/user_api.dart';
import 'package:posapp/components/form_product.dart';
import 'package:posapp/components/product.dart';
import 'package:posapp/notifier/product_notifier.dart';
import 'package:posapp/pages/home.dart';
import 'package:posapp/pages/page_add_products.dart';
import 'package:posapp/pages/page_products_details.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    ProductNotifier productNotifier =
        Provider.of<ProductNotifier>(context, listen: false);
    getProducts(productNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier = Provider.of<ProductNotifier>(context);
    Future<void> _refreshList() async {
      getProducts(productNotifier);
    }

    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.purple),
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Text(
          'คลังสินค้า',
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: new RefreshIndicator(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(
                productNotifier.productList[index].images != null
                    ? productNotifier.productList[index].images
                    : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              title: Text(productNotifier.productList[index].name),
              subtitle: Text(productNotifier.productList[index].salePrice),
              onTap: () {
                productNotifier.currentProduct =
                    productNotifier.productList[index];
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ProductDetail();
                }));
              },
            );
          },
          itemCount: productNotifier.productList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.black,
            );
          },
        ),
        onRefresh: _refreshList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productNotifier.currentProduct = null;
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return addProducts(
//                isUpdating: false,
                  );
            }),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
//      ),ListView(
//        margin: const EdgeInsets.only(left: 40, right: 40),
//        child: ClipRRect(
//          child: Column(
//        children: <Widget>[
//          new Padding(padding: const EdgeInsets.all(20)),
//          SizedBox(
//            height: 50,
//            child: Material(
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(18.0)),
//              color: Colors.orange, // button color
//              child: InkWell(
//                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                    builder: (context) => new addProducts())), // button pressed
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Icon(
//                      Icons.add,
//                      color: Colors.white,
//                    ), // icon
//                    Text(
//                      "Add Product",
//                      style: TextStyle(color: Colors.white, fontSize: 18),
//                    ), // text
//                  ],
//                ),
//              ),
//            ),
//          ),
//          SizedBox(
//            height: 20,
//          ),
//
//        ],
//      ),
    );
//      ),
//    );
  }
}
