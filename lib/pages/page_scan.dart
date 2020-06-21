import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posapp/bloc/main_bloc.dart';

class ScanPage extends StatelessWidget {
  MainBloc _mainBloc;

  @override
  Widget build(BuildContext context) {
    _mainBloc = BlocProvider.of<MainBloc>(context);

    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.purple),
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Text(
          'scan',
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera),
            tooltip: "Scan",
            onPressed: () {
              _mainBloc.add(OpenScannerMainEvent());
            },
          )
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, _state) {
          if (_state is NormalMainState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _state.barcode ?? "ไม่พบข้อมูล",
                    style: GoogleFonts.itim(fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      _mainBloc.add(OpenScannerMainEvent());
                    },
                    color: Colors.blue,
                    elevation: 0,
                    child: Text(
                      "เริ่ม Scan",
                      style:
                          GoogleFonts.itim(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container(
              color: Colors.black,
            );
          }
        },
      ),
    );
  }
}
