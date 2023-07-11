part of 'navigation_bloc_bloc.dart';

@immutable
abstract class NavigationBlocEvent extends Equatable {
  const NavigationBlocEvent();

  @override
  List<Object> get props => [];
}

class TabChangeEvent extends NavigationBlocEvent
{
  final int tabIndex;

  const TabChangeEvent({required this.tabIndex});
}
