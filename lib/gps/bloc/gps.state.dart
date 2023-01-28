part of 'gps.bloc.dart';

class GpsState extends Equatable {

  final bool isEnabled;
  final bool isGranted;

  const GpsState({ required this.isEnabled, required this.isGranted });
  
  GpsState copyWith({
    bool? isEnabled,
    bool? isGranted
  }) => GpsState(
    isEnabled: isEnabled ?? this.isEnabled, 
    isGranted: isGranted ?? this.isGranted
  );

  @override
  List<Object> get props => [ isEnabled, isGranted ];

  @override
  String toString() => 'enable: $isEnabled, granted: $isGranted';
}