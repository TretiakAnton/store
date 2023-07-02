part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class MapInitial extends StoreState {}

class MapInProgress extends StoreState {}

class MapCompleted extends StoreState {}

class MapFailed extends StoreState {}
