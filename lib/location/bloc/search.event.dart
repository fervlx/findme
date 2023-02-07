part of 'search.bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class OnManualSelect extends SearchEvent { }

class OnCancelManualSelect extends SearchEvent { }