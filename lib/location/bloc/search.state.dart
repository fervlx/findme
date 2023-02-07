part of 'search.bloc.dart';

class SearchState extends Equatable {

  final bool isSelectionManual;

  const SearchState({ this.isSelectionManual = false });

  SearchState copyWith({ 
    bool? isSelectionManual
  }) => SearchState( isSelectionManual: isSelectionManual ?? this.isSelectionManual );

  @override
  List<Object> get props => [ isSelectionManual ];
}
