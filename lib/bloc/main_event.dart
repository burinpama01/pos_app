part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class InitialMainEvent extends MainEvent {
  InitialMainEvent();
}

class OpenScannerMainEvent extends MainEvent {
  OpenScannerMainEvent();
}
