import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infohive/services/articles/bloc/articles_event.dart';
import 'package:infohive/services/articles/bloc/articles_state.dart';


class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(ArticlesInitial()) {
    on<ArticlesEvent>((event, emit) {
    });
  }
}