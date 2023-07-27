import 'package:flutter/material.dart';
import '../apis/michanic_api.dart';
import '../models/mechanic_data_model.dart';


class MechanicDataProvider with ChangeNotifier {
  MechanicPage1Data _page1Data = MechanicPage1Data(
    mechanicName: '',
    mechanicMobileNo: '',
    mechanicEmailId: '',
    mechanicAddress: '',
    mechanicPinCode: '',
  );

  MechanicPage2Data _page2Data = MechanicPage2Data(
    mechanicAdharNo: '',
    mechanicDL: '',
    mechanicPAN: '',
    mechanicWorkshopId: '',
  );

  MechanicPage3Data _page3Data = MechanicPage3Data(
    organizationName: '',
    workshopName: '',
    ownerName: '',
    ownerPhoneNumber: '',
  );

  MechanicPage4Data _page4Data = MechanicPage4Data(
    accountType: '',
    accountHolderName: '',
    accountNumber: '',
    ifscCode: '',
  );

  MechanicPage1Data get page1Data => _page1Data;
  MechanicPage2Data get page2Data => _page2Data;
  MechanicPage3Data get page3Data => _page3Data;
  MechanicPage4Data get page4Data => _page4Data;

  void updatePage1Data(MechanicPage1Data newData) {
    _page1Data = newData;
    notifyListeners();
  }

  void updatePage2Data(MechanicPage2Data newData) {
    _page2Data = newData;
    notifyListeners();
  }

  void updatePage3Data(MechanicPage3Data newData) {
    _page3Data = newData;
    notifyListeners();
  }

  void updatePage4Data(MechanicPage4Data newData) {
    _page4Data = newData;
    notifyListeners();
  }

  // Future<bool> sendDataToServer() async {
  //   final mechanicData = MechanicDataModel(
  //     page1Data: _page1Data,
  //     page2Data: _page2Data,
  //     page3Data: _page3Data,
  //     page4Data: _page4Data,
  //   );
  //   final result = await MechanicAPI.submitMechanicData(mechanicData);
  //   return result;
  // }
}
