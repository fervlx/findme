part of 'maps.bloc.dart';

class MapsState extends Equatable {
  
  final bool isMapInitialized;
  final bool focusOnPosition;
  
  const MapsState({
    required this.isMapInitialized, 
    required this.focusOnPosition 
  });

  MapsState copyWith({
    bool? isMapInitialized,
    bool? focusOnPosition,
  }) => MapsState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized, 
    focusOnPosition: focusOnPosition ?? this.focusOnPosition
  );

  @override
  List<Object> get props => [
    isMapInitialized,
    focusOnPosition
  ];
}
