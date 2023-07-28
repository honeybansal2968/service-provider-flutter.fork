class GeneralDetailsData {
  String fullName;
  String phoneNo;
  String email;
  String address;
  String pincode;

  GeneralDetailsData({
    required this.fullName,
    required this.phoneNo,
    required this.email,
    required this.address,
    required this.pincode,
  });

  // Add a method to convert the data model to a Map for API transmission
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNo': phoneNo,
      'email': email,
      'address': address,
      'pincode': pincode,
      "googleUserId": "",


    };
  }
}

class DocumentDetailsData {
  String aadhaarNo;
  String drivingLicenceNo;
  String panCardNo;
  String mechanicWorkshopId;

  DocumentDetailsData({
    required this.aadhaarNo,
    required this.drivingLicenceNo,
    required this.panCardNo,
    required this.mechanicWorkshopId,
  });

  // Add a method to convert the data model to a Map for API transmission
  Map<String, dynamic> toJson() {
    return {
      'aadhaarNo': aadhaarNo,
      'drivingLicenceNo': drivingLicenceNo,
      'panCardNo': panCardNo,
      // 'mechanicWorkshopId': mechanicWorkshopId,
    };
  }
}

class WorkshopDetailsData {
  String orgName;
  String workshopName;
  String ownerName;
  String ownerPhoneNo;

  WorkshopDetailsData({
    required this.orgName,
    required this.workshopName,
    required this.ownerName,
    required this.ownerPhoneNo,
  });

  // Add a method to convert the data model to a Map for API transmission
  Map<String, dynamic> toJson() {
    return {
      'organizationName': orgName,
      'workshopName': workshopName,
      'ownerName': ownerName,
      'ownerPhoneNumber': ownerPhoneNo,
    };
  }
}

class BankDetailsData {
  String accountType;
  String accountHolderName;
  String accountNumber;
  String ifscCode;

  BankDetailsData({
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
  GeneralDetailsData page1Data;
  DocumentDetailsData page2Data;
  WorkshopDetailsData page3Data;
  BankDetailsData page4Data;

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

/*
{
  "role": "mechanic",
  "mechanicId": "",
  "workshopDetails": {
    "organization": {
      "orgName": "nilesh",
      "ownerName": "my",
      "ownerPhoneNo": "189746786"
    }
  },
  "generalDetails": {
    "fullName": "nile",
    "email": "omsai@gmail.com",
    "phoneNo": "1289678901222",
    "address": "123 Maghjit",
    "pincode": "783466439"
  },
  "documentDetails": {
    "aadhaarNo": "1234455664901234",
    "drivingLicenceNo": "DL1434455678",
    "panCardNo": "ABCDE1894FGHI"
  },
  "bankDetails": {
    "bankAccountType": "savings",
    "accountHolderName": "John Doe",
    "bankAccountNo": "12345674301212",
    "ifscCode": "ABCD12345538912"
  }
}
 */