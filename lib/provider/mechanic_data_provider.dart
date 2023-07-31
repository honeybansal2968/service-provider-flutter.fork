import 'package:flutter/material.dart';
import '../apis/michanic_api.dart';
import '../models/mechanic_data_model.dart';

class MechanicDataProvider with ChangeNotifier {

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // Setter for isLoading
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _apiErrorMessage = '';

  String get apiErrorMessage => _apiErrorMessage;

  // Method to update the API error message
  void updateApiErrorMessage(String errorMessage) {
    _apiErrorMessage = errorMessage;
    notifyListeners();
  }

  // Method to clear the API error message
  void clearApiErrorMessage() {
    _apiErrorMessage = '';
    notifyListeners();
  }

  GeneralDetails _page1Data = GeneralDetails(
    fullName: '',
    email: '',
    phoneNo: '',
    address: '',
    pincode: '',
  );

  DocumentDetails _page2Data = DocumentDetails(
    aadhaarNo: '',
    drivingLicenceNo: '',
    panCardNo: '',
  );

  Organization _page3Data = Organization(
    orgName: '',
    ownerName: '',
    ownerPhoneNo: '',
  );

  WorkshopDetails _workshopDetails = WorkshopDetails(organization: Organization(
    orgName: '',
    ownerName: '',
    ownerPhoneNo: '',
  ));

  BankDetails _page4Data = BankDetails(
    bankAccountType: '',
    accountHolderName: '',
    bankAccountNo: '',
    ifscCode: '',
  );

  GeneralDetails get page1Data => _page1Data;
  DocumentDetails get page2Data => _page2Data;
  Organization get page3Data => _page3Data;
  BankDetails get page4Data => _page4Data;
  WorkshopDetails get orgdata => _workshopDetails;

  MechanicDataProvider() {
    // Initialize the WorkshopDetails here with the correct Organization data
    _workshopDetails = WorkshopDetails(organization: _page3Data);
  }

  void updatePage1Data(GeneralDetails newData) {
    _page1Data = newData;
    notifyListeners();
  }

  void updatePage2Data(DocumentDetails newData) {
    _page2Data = newData;
    notifyListeners();
  }

  void updatePage3Data(Organization newData) {
    _page3Data = newData;
    _workshopDetails = WorkshopDetails(organization: _page3Data);
    notifyListeners();
  }

  void updatePage4Data(BankDetails newData) {
    _page4Data = newData;
    notifyListeners();
  }
}
