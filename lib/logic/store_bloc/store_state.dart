part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}

class StoreInProgress extends StoreState {}

class StoreCompleted extends StoreState {}

class StoreFailed extends StoreState {}
