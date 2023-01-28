part of 'gps.bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}

class GpsStatus extends GpsEvent { 
  final bool isEnabled;
  final bool isGranted;

  const GpsStatus({ required this.isEnabled, required this.isGranted });
}