// To parse this JSON data, do
//
//     final mechanic = mechanicFromJson(jsonString);

import 'dart:convert';

// Mechanic mechanicFromJson(String str) => Mechanic.fromJson(json.decode(str));
//
// String mechanicToJson(Mechanic data) => json.encode(data.toJson());

class Mechanic {
  String role;
  String mechanicId;
  WorkshopDetails workshopDetails;
  GeneralDetails generalDetails;
  DocumentDetails documentDetails;
  BankDetails bankDetails;

  Mechanic({
    required this.role,
    required this.mechanicId,
    required this.workshopDetails,
    required this.generalDetails,
    required this.documentDetails,
    required this.bankDetails,
  });

  factory Mechanic.fromJson(Map<String, dynamic> json) => Mechanic(
    role: json["role"],
    mechanicId: json["mechanicId"],
    workshopDetails: WorkshopDetails.fromJson(json["workshopDetails"]),
    generalDetails: GeneralDetails.fromJson(json["generalDetails"]),
    documentDetails: DocumentDetails.fromJson(json["documentDetails"]),
    bankDetails: BankDetails.fromJson(json["bankDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "mechanicId": mechanicId,
    "workshopDetails": workshopDetails.toJson(),
    "generalDetails": generalDetails.toJson(),
    "documentDetails": documentDetails.toJson(),
    "bankDetails": bankDetails.toJson(),
  };
}

class BankDetails {
  String bankAccountType;
  String accountHolderName;
  String bankAccountNo;
  String ifscCode;

  BankDetails({
    required this.bankAccountType,
    required this.accountHolderName,
    required this.bankAccountNo,
    required this.ifscCode,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
    bankAccountType: json["bankAccountType"],
    accountHolderName: json["accountHolderName"],
    bankAccountNo: json["bankAccountNo"],
    ifscCode: json["ifscCode"],
  );

  Map<String, dynamic> toJson() => {
    "bankAccountType": bankAccountType,
    "accountHolderName": accountHolderName,
    "bankAccountNo": bankAccountNo,
    "ifscCode": ifscCode,
  };
}

class DocumentDetails {
  String aadhaarNo;
  String drivingLicenceNo;
  String panCardNo;

  DocumentDetails({
    required this.aadhaarNo,
    required this.drivingLicenceNo,
    required this.panCardNo,
  });

  factory DocumentDetails.fromJson(Map<String, dynamic> json) => DocumentDetails(
    aadhaarNo: json["aadhaarNo"],
    drivingLicenceNo: json["drivingLicenceNo"],
    panCardNo: json["panCardNo"],
  );

  Map<String, dynamic> toJson() => {
    "aadhaarNo": aadhaarNo,
    "drivingLicenceNo": drivingLicenceNo,
    "panCardNo": panCardNo,
  };
}

class GeneralDetails {
  String fullName;
  String email;
  String phoneNo;
  String address;
  String pincode;

  GeneralDetails({
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.pincode,
  });

  factory GeneralDetails.fromJson(Map<String, dynamic> json) => GeneralDetails(
    fullName: json["fullName"],
    email: json["email"],
    phoneNo: json["phoneNo"],
    address: json["address"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "phoneNo": phoneNo,
    "address": address,
    "pincode": pincode,
  };
}

class WorkshopDetails {
  Organization organization;

  WorkshopDetails({
    required this.organization,
  });

  factory WorkshopDetails.fromJson(Map<String, dynamic> json) => WorkshopDetails(
    organization: Organization.fromJson(json["organization"]),
  );

  Map<String, dynamic> toJson() => {
    "organization": organization.toJson(),
  };
}

class Organization {
  String orgName;
  String ownerName;
  String ownerPhoneNo;

  Organization({
    required this.orgName,
    required this.ownerName,
    required this.ownerPhoneNo,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
    orgName: json["orgName"],
    ownerName: json["ownerName"],
    ownerPhoneNo: json["ownerPhoneNo"],
  );

  Map<String, dynamic> toJson() => {
    "orgName": orgName,
    "ownerName": ownerName,
    "ownerPhoneNo": ownerPhoneNo,
  };
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

/*
{
    "success": true,
    "message": "Mechanic signed up successfully",
    "mechanic": {
        "role": "mechanic",
        "workshop": {
            "workshopUid": "54",
            "organization": {
                "orgName": "nilesh",
                "ownerName": "my",
                "ownerPhoneNo": "189746786"
            },
            "_id": "64c39679657d875cfc3a52b3",
            "__v": 0
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
        },
        "accountDisable": false,
        "_id": "64c39679657d875cfc3a52b5",
        "__v": 0
    }

}
*/