import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class NavigationBlocState extends Equatable {
  final int tabIndex;

  const NavigationBlocState({required this.tabIndex});

  @override
  List<Object> get props => [];
}

class NavigationBlocInitial extends NavigationBlocState {
  const NavigationBlocInitial({required super.tabIndex});
}
