import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_services_event.dart';
import 'customer_services_state.dart';

class CustomerServicesBloc
    extends Bloc<CustomerServicesEvent, CustomerServicesState> {
  CustomerServicesBloc() : super(CustomerServicesInitial());
  List<List<List<String?>>> listCustomerService = [];
  List<List<Map<String,String>>> listCustomerSubService=[];
  List<List<Map<String,String>>> listCustomerServiceGroup=[];
  List<String?> notes=[];

  @override
  Stream<CustomerServicesState> mapEventToState(
      CustomerServicesEvent event) async* {
    yield CustomerServicesLoading();
    if (event is AddServiceGroup) {
      try {
        yield CustomerServicesSuccess();
      } catch (e) {
        yield CustomerServicesFailure(e.toString());
      }
    }
    if (event is AddCustomer) {
      yield CustomerServicesLoading();
        listCustomerService.add([]);
        notes.add(null);
      yield CustomerServicesSuccess();

    }
    if (event is RemoveCustomer) {
      yield CustomerServicesLoading();
        listCustomerService.removeAt(event.customerIndex);
        listCustomerSubService.removeAt(event.customerIndex);
        listCustomerServiceGroup.removeAt(event.customerIndex);
      notes.removeAt(event.customerIndex);
      yield CustomerServicesSuccess();
    }
    if (event is RemoveServiceGroup) {
      yield CustomerServicesLoading();
        listCustomerService[event.customerIndex].removeAt(event.serviceIndex);
      listCustomerSubService[event.customerIndex].removeAt(event.serviceIndex);
      listCustomerServiceGroup[event.customerIndex].removeAt(event.customerIndex);
      yield CustomerServicesSuccess();
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
