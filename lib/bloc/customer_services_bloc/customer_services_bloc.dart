import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_services_event.dart';
import 'customer_services_state.dart';

class CustomerServicesBloc
    extends Bloc<CustomerServicesEvent, CustomerServicesState> {
  CustomerServicesBloc() : super(CustomerServicesInitial());
  List<String> listServiceGroup = [
    "SPA - Triệt lông dưới cánh tay (5 lần)",
    "SPA - Chăm sóc da mặt cơ bản"
  ];
  List<String> listSubService = ["Dịch vụ thông thường"];
  List<List<String>> listCustomerService = [[]];

  @override
  Stream<CustomerServicesState> mapEventToState(
      CustomerServicesEvent event) async* {
    yield CustomerServicesLoading();
    if (event is AddServiceGroup) {
      try {
        if (listCustomerService[event.customerIndex].isEmpty)
          listCustomerService.add([listServiceGroup[0] + listSubService[0]]);
        else
          listCustomerService[event.customerIndex]
              .add(listServiceGroup[0] + listSubService[0]);
        yield CustomerServicesSuccess();
      } catch (e) {
        yield CustomerServicesFailure(e.toString());
      }
    }
    if (event is AddCustomer) {
      try {
        listCustomerService.add([]);
        yield CustomerServicesSuccess();
      } catch (e) {
        yield CustomerServicesFailure(e.toString());
      }
    }
    if (event is RemoveCustomer) {
      try {
        listCustomerService.removeAt(event.customerIndex);
        yield CustomerServicesSuccess();
      } catch (e) {
        yield CustomerServicesFailure(e.toString());
      }
    }
    if (event is RemoveServiceGroup) {
      try {
        listCustomerService[event.customerIndex].removeAt(event.serviceIndex);
        yield CustomerServicesSuccess();
      } catch (e) {
        yield CustomerServicesFailure(e.toString());
      }
    }
  }
}
