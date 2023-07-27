class MechanicPage1Data {
  String mechanicName;
  String mechanicMobileNo;
  String mechanicEmailId;
  String mechanicAddress;
  String mechanicPinCode;

  MechanicPage1Data({
    required this.mechanicName,
    required this.mechanicMobileNo,
    required this.mechanicEmailId,
    required this.mechanicAddress,
    required this.mechanicPinCode,
  });

  // Add a method to convert the data model to a Map for API transmission
  Map<String, dynamic> toJson() {
    return {
      'fullName': mechanicName,
      'phoneNo': mechanicMobileNo,
      'email': mechanicEmailId,
      'address': mechanicAddress,
      'pincode': mechanicPinCode,
      "googleUserId": "",


    };
  }
}

class MechanicPage2Data {
  String mechanicAdharNo;
  String mechanicDL;
  String mechanicPAN;
  String mechanicWorkshopId;

  MechanicPage2Data({
    required this.mechanicAdharNo,
    required this.mechanicDL,
    required this.mechanicPAN,
    required this.mechanicWorkshopId,
  });

  // Add a method to convert the data model to a Map for API transmission
  Map<String, dynamic> toJson() {
    return {
      'aadhaarNo': mechanicAdharNo,
      'drivingLicenceNo': mechanicDL,
      'panCardNo': mechanicPAN,
      // 'mechanicWorkshopId': mechanicWorkshopId,
    };
  }
}

class MechanicPage3Data {
  String organizationName;
  String workshopName;
  String ownerName;
  String ownerPhoneNumber;

  MechanicPage3Data({
    required this.organizationName,
    required this.workshopName,
    required this.ownerName,
    required this.ownerPhoneNumber,
  });

  // Add a method to convert the data model to a Map for API transmission
  Map<String, dynamic> toJson() {
    return {
      'organizationName': organizationName,
      'workshopName': workshopName,
      'ownerName': ownerName,
      'ownerPhoneNumber': ownerPhoneNumber,
    };
  }
}

class MechanicPage4Data {
  String accountType;
  String accountHolderName;
  String accountNumber;
  String ifscCode;

  MechanicPage4Data({
    required this.accountType,
    required this.accountHolderName,
    required this.accountNumber,
    required this.ifscCode,
  });

  // Add a method to convert the data model to a Map for API transmission
  Map<String, dynamic> toJson() {
    return {
      'bankAccountType': accountType,
      'accountHolderName': accountHolderName,
      'bankAccountNo': accountNumber,
      'ifscCode': ifscCode,
    };
  }
}

class MechanicDataModel {
  MechanicPage1Data page1Data;
  MechanicPage2Data page2Data;
  MechanicPage3Data page3Data;
  MechanicPage4Data page4Data;

  MechanicDataModel({
    required this.page1Data,
    required this.page2Data,
    required this.page3Data,
    required this.page4Data,
  });

  // Add a method to convert the data model to a Map for API transmission
  Map<String, dynamic> toJson() {
    return {
      'page1Data': page1Data.toJson(),
      'page2Data': page2Data.toJson(),
      'page3Data': page3Data.toJson(),
      'page4Data': page4Data.toJson(),
    };
  }
}
