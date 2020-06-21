import 'package:flutter/material.dart';
import 'package:posapp/provider/user_provider.dart';
import 'package:posapp/services/styles.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  const ProductCard(
      {Key key, @required this.name, @required this.price, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.green[200], offset: Offset(2, 1), blurRadius: 5)
            ]),
        child: ListTile(
          onTap: () {
//            Navigator.pop(context);
          },
          leading: Image.network(
            '$image',
            width: 80,
            height: 80,
          ),
          title: Text(name),
          subtitle: Text("\$${price.toString()}"),
          trailing: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: CustomText(
                  msg: "Buy",
                  color: white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
