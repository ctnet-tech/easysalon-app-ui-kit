import 'package:equatable/equatable.dart';

abstract class CustomerServicesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddServiceGroup extends CustomerServicesEvent {
  final int customerIndex;

  AddServiceGroup({required this.customerIndex});
}

class AddCustomer extends CustomerServicesEvent {}

class RemoveCustomer extends CustomerServicesEvent {
  final int customerIndex;

  RemoveCustomer({required this.customerIndex});
}

class RemoveServiceGroup extends CustomerServicesEvent {
  final int customerIndex;
  final int serviceIndex;

  RemoveServiceGroup({required this.customerIndex, required this.serviceIndex});
}

class ChangeService extends CustomerServicesEvent {
  final int customerIndex;
  final String value;

  ChangeService({required this.customerIndex, required this.value});
}