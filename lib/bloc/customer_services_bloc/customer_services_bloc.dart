import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_services_event.dart';
import 'customer_services_state.dart';

class CustomerServicesBloc
    extends Bloc<CustomerServicesEvent, CustomerServicesState> {
  CustomerServicesBloc() : super(CustomerServicesInitial());
  List<List<List<String?>>> listCustomerService = [];

 late List<String?> notes;

  @override
  Stream<CustomerServicesState> mapEventToState(
      CustomerServicesEvent event) async* {
    yield CustomerServicesLoading();
    if (event is AddServiceGroup) {
      try {
        if(listCustomerService.isEmpty&& listCustomerService.length==1)
          listCustomerService[event.customerIndex][0]=[null,null];
        else listCustomerService[event.customerIndex].add([null,null]);
        print(listCustomerService);
        yield CustomerServicesSuccess();
      } catch (e) {
        yield CustomerServicesFailure(e.toString());
      }
    }
    if (event is AddCustomer) {
      try {
        listCustomerService.add([]);
        notes.add(null);
        print(listCustomerService);
        yield CustomerServicesSuccess();
      } catch (e) {
        yield CustomerServicesFailure(e.toString());
      }
    }
    if (event is RemoveCustomer) {
      try {
        listCustomerService.removeAt(event.customerIndex);
        print(listCustomerService);
        yield CustomerServicesSuccess();
      } catch (e) {
        yield CustomerServicesFailure(e.toString());
      }
    }
    if (event is RemoveServiceGroup) {
      try {
        listCustomerService[event.customerIndex].removeAt(event.serviceIndex);
        print(listCustomerService);
        yield CustomerServicesSuccess();
      } catch (e) {
        yield CustomerServicesFailure(e.toString());
      }
    }
    if (event is ChangeService) {
      try {
        yield CustomerServicesSuccess();
      } catch (e) {
        yield CustomerServicesFailure(e.toString());
      }
    }
  }
}
