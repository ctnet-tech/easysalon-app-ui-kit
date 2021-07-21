import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_services_event.dart';
import 'customer_services_state.dart';

class CustomerServicesBloc
    extends Bloc<CustomerServicesEvent, CustomerServicesState> {
  CustomerServicesBloc() : super(CustomerServicesInitial());
  List<List<List<String?>>> listCustomerService = [];
  List<List<Map<String, Map<String,List<int>>>>> listCustomerSubService = [];
  List<List<String?>> dropdownSubServiceValue = [];
  List<List<String?>> dropdownServiceGroupValue = [];
  List<String?> notes = [];

  List<List<List<int>>> timeAndCostSubService = [];

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
      timeAndCostSubService.removeAt(event.customerIndex);

      notes.removeAt(event.customerIndex);
      yield CustomerServicesSuccess();
    }
    if (event is RemoveServiceGroup) {
      yield CustomerServicesLoading();

      for (int i = event.serviceIndex;
          i < listCustomerService[event.customerIndex].length - 1;
          i++) {
        listCustomerService[event.customerIndex][i] =
            listCustomerService[event.customerIndex][i + 1];
        listCustomerSubService[event.customerIndex][i] =
            listCustomerSubService[event.customerIndex][i + 1];
        dropdownSubServiceValue[event.customerIndex][i] =
            dropdownSubServiceValue[event.customerIndex][i + 1];
        dropdownServiceGroupValue[event.customerIndex][i] =
            dropdownServiceGroupValue[event.customerIndex][i + 1];
        timeAndCostSubService[event.customerIndex][i] =
            timeAndCostSubService[event.customerIndex][i + 1];
      }
      listCustomerService[event.customerIndex].removeLast();
      listCustomerSubService[event.customerIndex].removeLast();
      dropdownSubServiceValue[event.customerIndex].removeLast();
      dropdownServiceGroupValue[event.customerIndex].removeLast();
      timeAndCostSubService[event.customerIndex].removeLast();
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
