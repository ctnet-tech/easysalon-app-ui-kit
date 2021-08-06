import 'package:flutter/material.dart';

class CustomerServicesProvider extends ChangeNotifier
{
  List<List<List<String?>>> listCustomerService = [];
  List<List<Map<String, Map<String, List<int>>>>> listCustomerSubService = [];
  List<List<String?>> dropdownSubServiceValue = [];
  List<List<String?>> dropdownServiceGroupValue = [];
  List<String?> notes = [];
  List<List<List<int>>> timeAndCostSubService = [];

  addServiceGroup({required int customerIndex})
  {
    notifyListeners();
  }

  addCustomer()
  {
    listCustomerService.add([]);
    notes.add(null);
    notifyListeners();
  }

  removeCustomer({required int customerIndex})
  {
    listCustomerService.removeAt(customerIndex);
    listCustomerSubService.removeAt(customerIndex);
    timeAndCostSubService.removeAt(customerIndex);
    notes.removeAt(customerIndex);
    notifyListeners();
  }

  removeServiceGroup({
    required int customerIndex,
    required int serviceIndex,
  })
  {
    for (int i = serviceIndex;
    i < listCustomerService[customerIndex].length - 1;
    i++)
    {
      listCustomerService[customerIndex][i] =
      listCustomerService[customerIndex][i + 1];
      listCustomerSubService[customerIndex][i] =
      listCustomerSubService[customerIndex][i + 1];
      dropdownSubServiceValue[customerIndex][i] =
      dropdownSubServiceValue[customerIndex][i + 1];
      dropdownServiceGroupValue[customerIndex][i] =
      dropdownServiceGroupValue[customerIndex][i + 1];
      timeAndCostSubService[customerIndex][i] =
      timeAndCostSubService[customerIndex][i + 1];
    }
    listCustomerService[customerIndex].removeLast();
    listCustomerSubService[customerIndex].removeLast();
    dropdownSubServiceValue[customerIndex].removeLast();
    dropdownServiceGroupValue[customerIndex].removeLast();
    timeAndCostSubService[customerIndex].removeLast();
    notifyListeners();
  }
}
