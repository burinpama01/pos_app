part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class InitialMainState extends MainState {}

class NormalMainState extends MainState {
  final String barcode;

  NormalMainState({this.barcode});
}

class ScannerIsUsingMainState extends MainState {}
