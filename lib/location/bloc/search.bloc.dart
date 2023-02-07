import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search.event.dart';
part 'search.state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  SearchBloc() : super( const SearchState() ) {
    
    on<OnManualSelect>((event, emit) => emit( state.copyWith( isSelectionManual: true )));

    on<OnCancelManualSelect>((event, emit) => emit( state.copyWith( isSelectionManual: false )));
  }
}
