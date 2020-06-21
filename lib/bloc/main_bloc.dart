import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  MainState get initialState => InitialMainState();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is InitialMainEvent) {
      yield NormalMainState();
    } else if (event is OpenScannerMainEvent) {
      yield* mapScannerToState(event);
    }
  }

  @override
  Stream<MainState> mapScannerToState(OpenScannerMainEvent event) async* {
    yield ScannerIsUsingMainState();
    ScanResult result = await BarcodeScanner.scan();
    if (result.type == ResultType.Barcode) {
      yield NormalMainState(barcode: result.rawContent);
    } else {
      yield NormalMainState(barcode: null);
    }
  }
}
