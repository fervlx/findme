part of 'location.bloc.dart';

class LocationState extends Equatable {

  final bool liveLocation;

  const LocationState({ this.liveLocation = false });
  
  @override
  List<Object> get props => [ liveLocation ];
}
