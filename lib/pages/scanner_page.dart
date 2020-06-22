import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posapp/bloc/external/external_bloc.dart';

class ScannerPage extends StatefulWidget {
  ScannerPage({Key key}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  ExternalBloc _externalBloc;
  @override
  Widget build(BuildContext context) {
    _externalBloc = BlocProvider.of<ExternalBloc>(context);

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
              _externalBloc.add(OpenScannerExternalEvent());
            },
          )
        ],
      ),
      body: BlocBuilder<ExternalBloc, ExternalState>(
        builder: (BuildContext context, _state) {
          print(_state);
          if (_state is NormalExternalState) {
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
                      _externalBloc.add(OpenScannerExternalEvent());
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
              color: Colors.red,
            );
          }
        },
      ),
    );
  }
}
