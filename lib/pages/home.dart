import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posapp/api/user_api.dart';
import 'package:posapp/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:posapp/bloc/user_repository.dart';
import 'package:posapp/notifier/auth_notifier.dart';
import 'package:posapp/pages/cart.dart';
import 'package:posapp/pages/page_login.dart';
import 'package:posapp/pages/page_products.dart';
import 'package:posapp/pages/page_report.dart';
import 'package:posapp/pages/page_scan.dart';
import 'package:posapp/pages/page_setting.dart';
import 'package:posapp/services/functions.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String email;
  final UserRepository _userRepository;

  HomePage(
      {Key key, @required this.name, this.email, UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.purple),
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Text(
          'POS',
          style: TextStyle(color: Colors.purple, fontSize: 30),
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(
                "$name",
              ),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              accountEmail: Text(
                "$email",
              ),
            ),
            InkWell(
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  AuthenticationLoggedOut(),
                );
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.highlight_off),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
//          mainAxisAlignment: MainAxisAlignment.center,

        child: ClipRRect(
          child: ListView(
            children: <Widget>[
              new Padding(padding: const EdgeInsets.all(20)),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Colors.purple, // button color
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (context) =>
                                new Cart())), // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                          size: 100,
                        ), // icon
                        Text(
                          "ขายสินค้า",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ), // text
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Colors.purple, // button color
                  child: InkWell(
                    onTap: () {
                      changeScreen(context, ProductsPage());
                    }, // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: Colors.white,
                          size: 100,
                        ), // icon
                        Text(
                          "คลังสินค้า",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ), // text
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Colors.purple, // button color
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (context) =>
                                new ReportPage())), // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.description,
                          color: Colors.white,
                          size: 100,
                        ), // icon
                        Text(
                          "รายงาน",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ), // text
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Colors.purple, // button color
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (context) =>
                                new SettingPage())), // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 100,
                        ), // icon
                        Text(
                          "ตั้งค่า",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ), // text
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
