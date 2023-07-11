import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infohive/services/navigation/bloc/navigation_bloc_state.dart';

part 'navigation_bloc_event.dart';

class NavigationBloc extends Bloc<NavigationBlocEvent, NavigationBlocState> {
  NavigationBloc() : super(const NavigationBlocInitial(tabIndex: 1)) {
    on<TabChangeEvent>((event, emit) {
      emit(NavigationBlocInitial(tabIndex: event.tabIndex));
    });
  }
}
