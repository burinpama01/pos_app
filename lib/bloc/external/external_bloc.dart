import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'external_event.dart';

part 'external_state.dart';

class ExternalBloc extends Bloc<ExternalEvent, ExternalState> {
  @override
  ExternalState get initialState => InitialExternalState();

  @override
  Stream<ExternalState> mapEventToState(ExternalEvent event) async* {
    if (event is InitialExternalEvent) {
      yield NormalExternalState();
    } else if (event is OpenScannerExternalEvent) {
      yield* mapScannerToState(event);
    }
  }

  @override
  Stream<ExternalState> mapScannerToState(
      OpenScannerExternalEvent event) async* {
    yield ScannerIsUsingExternalState();
    try {
      ScanResult result = await BarcodeScanner.scan().then((value) {
        print(value.rawContent);
        return value;
      }).catchError((error) {
        print("catchError $error}");
      });

      print("HELLO");
      if (result.type == ResultType.Barcode) {
        yield NormalExternalState(barcode: result.rawContent);
      } else {
        yield NormalExternalState(barcode: null);
      }
    } catch (e) {
      yield NormalExternalState(barcode: null);
      print(e);
    }
  }
}
