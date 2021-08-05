import 'package:equatable/equatable.dart';

abstract class CustomerServicesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CustomerServicesInitial extends CustomerServicesState {}

class CustomerServicesLoading extends CustomerServicesState {}

class CustomerServicesSuccess extends CustomerServicesState {
}

class CustomerServicesFailure extends CustomerServicesState {
  CustomerServicesFailure(this.error);

  final String error;
}
