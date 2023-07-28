import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../apis/michanic_api.dart';
import '../../../components/my_button_2.dart';
import '../../../components/my_text_form_field.dart';
import '../../../home/all_parts_integrated.dart';
import '../../../models/mechanic_data_model.dart';
import '../../../provider/mechanic_data_provider.dart';

class MachanicPage4 extends StatefulWidget {
  const MachanicPage4({Key? key}) : super(key: key);

  @override
  State<MachanicPage4> createState() => _MachanicPage4State();
}

class _MachanicPage4State extends State<MachanicPage4>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _controllermachnaicaccholdername = TextEditingController();
  final _controllermachanicaccno = TextEditingController();
  final _controllermachanicownerifsccode = TextEditingController();

  // A variable to hold the selected account type
  var accountType = '';
  double dist = 10;

  @override
  void initState() {
    super.initState();

    // Fetch the Organization data from the provider
    final dataProvider =
        Provider.of<MechanicDataProvider>(context, listen: false);
    final page4Data = dataProvider.page4Data;

    // Autofill the TextEditingControllers with page4Data

    _controllermachnaicaccholdername.text = page4Data.accountHolderName;
    _controllermachanicaccno.text = page4Data.bankAccountNo;
    _controllermachanicownerifsccode.text = page4Data.ifscCode;
  }

  // keys
  final _key = GlobalKey<FormState>();

  // focusNodes
  final nameFocus = FocusNode();
  final numberFocus = FocusNode();
  final ifscFocus = FocusNode();

  // nextFocus
  void nextFocus(FocusNode node) => node.requestFocus();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(height: dist),

                const Text(
                  'Bank Account Details',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(height: dist),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Expanded(
                        child: Text(
                          'Account Type:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListTileTheme(
                          horizontalTitleGap: 0,
                          child: RadioListTile(
                            title: const Text('Savings'),
                            value: 'Savings',
                            groupValue: accountType,
                            onChanged: (value) {
                              setState(() {
                                accountType = value.toString();
                              });
                            },
                            activeColor: Colors.green,
                            // Set the color when selected
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTileTheme(
                          horizontalTitleGap: 0,
                          child: RadioListTile(
                            title: const Text('Current'),
                            value: 'Current',
                            groupValue: accountType,
                            onChanged: (value) {
                              setState(() {
                                accountType = value.toString();
                              });
                            },
                            activeColor: Colors.green,
                            // Set the color when selected
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ), // Row(

                SizedBox(height: dist),

                MyTextFormField(
                  controller: _controllermachnaicaccholdername,
                  onFieldSubmitted: (_) => nextFocus(numberFocus),
                  label: "Account Holder Name:",
                  hintText: "Enter Account Holder Name:",
                  validator: (name) {
                    if (name != null && name.trim().isNotEmpty) return null;
                    return "Please enter name";
                  },
                ),

                SizedBox(height: dist),

                MyTextFormField(
                  controller: _controllermachanicaccno,
                  focusNode: numberFocus,
                  onFieldSubmitted: (_) => nextFocus(ifscFocus),
                  label: "Account Number:",
                  hintText: "Enter Account Number:",
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                  maxLength: 20,
                  validator: (name) {
                    if (name != null && name.trim().isNotEmpty) return null;
                    return "Please enter name";
                  },
                ),

                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicownerifsccode,
                  focusNode: ifscFocus,
                  label: "IFSC Code:",
                  hintText: "Enter IFSC Code:",
                  validator: (name) {
                    if (name != null && name.trim().isNotEmpty) return null;
                    return "Please code";
                  },
                ),

                SizedBox(height: dist),

                MyButton2(
                    text: 'Review & Submit',
                    onTap: () {
                      final dataProvider = Provider.of<MechanicDataProvider>(
                          context,
                          listen: false);

                      print("clicked");
                      if (_key.currentState != null &&
                          _key.currentState!.validate()) {
                        final dataProvider = Provider.of<MechanicDataProvider>(
                            context,
                            listen: false);

                        final page4Data = BankDetails(
                          bankAccountType: accountType,
                          accountHolderName:
                              _controllermachnaicaccholdername.text,
                          bankAccountNo: _controllermachanicaccno.text,
                          ifscCode: _controllermachanicownerifsccode.text,
                        );

                        dataProvider.updatePage4Data(page4Data);

                        print("Validated");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewPage(
                              page1Data: dataProvider.page1Data,
                              page2Data: dataProvider.page2Data,
                              page3Data: dataProvider.page3Data,
                              page4Data: dataProvider.page4Data,
                            ),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewPage extends StatelessWidget {
  final GeneralDetails page1Data;
  final DocumentDetails page2Data;
  final Organization page3Data;
  final BankDetails page4Data;

  ReviewPage({
    required this.page1Data,
    required this.page2Data,
    required this.page3Data,
    required this.page4Data,
  });

  void _submitForm(BuildContext context) async {
    final dataProvider =
        Provider.of<MechanicDataProvider>(context, listen: false);

    final page1Data = dataProvider.page1Data;
    final page2Data = dataProvider.page2Data;
    final page3Data = dataProvider.page3Data;
    final page4Data = dataProvider.page4Data;

    final org = dataProvider.orgdata;

    final mechanicData = Mechanic(
      role: "mechanic",
      mechanicId: "",
      generalDetails: page1Data,
      documentDetails: page2Data,
      workshopDetails: org,
      bankDetails: page4Data,
    );

    final response = await MechanicAPI.submitMechanicData(mechanicData);

    if (response['success']) {
      // API call was successful
      print('Data sent successfully!');

      // Clear the data in the data provider after successful submission
      dataProvider.updatePage1Data(GeneralDetails(
        fullName: '',
        phoneNo: '',
        email: '',
        address: '',
        pincode: '',
      ));
      dataProvider.updatePage2Data(DocumentDetails(
        aadhaarNo: '',
        drivingLicenceNo: '',
        panCardNo: '',
      ));
      dataProvider.updatePage3Data(Organization(
        orgName: '',
        ownerName: '',
        ownerPhoneNo: '',
      ));
      dataProvider.updatePage4Data(BankDetails(
        bankAccountType: '',
        accountHolderName: '',
        bankAccountNo: '',
        ifscCode: '',
      ));

      // Show a success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data saved successfully!'),
          duration:
              Duration(seconds: 3), // Optional: Control the display duration
        ),

        // Navigate to the next screen or do something else here
      );

      MaterialPageRoute(builder: (context) => const IntegratedHome());
      // Navigate to the next screen or do something else here
    } else {
      // API call failed
      print('Failed to send data to the server.');
      dataProvider.updateApiErrorMessage(response['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Data'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.green.shade300,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Colors.green.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('General Details',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Text('Full Name: ${page1Data.fullName}',
                    style: TextStyle(fontSize: 16)),
                Text('Mobile No: ${page1Data.phoneNo}',
                    style: TextStyle(fontSize: 16)),
                Text('Email Id: ${page1Data.email}',
                    style: TextStyle(fontSize: 16)),
                Text('Address: ${page1Data.address}',
                    style: TextStyle(fontSize: 16)),
                Text('Pin Code: ${page1Data.pincode}',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                const Text('Document Details',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                Text('Aadhaar No: ${page2Data.aadhaarNo}',
                    style: TextStyle(fontSize: 16)),
                Text('Driving License No: ${page2Data.drivingLicenceNo}',
                    style: TextStyle(fontSize: 16)),
                Text('Pan Card No: ${page2Data.panCardNo}',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                const Text('Workshop Details',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                Text('Organization Name: ${page3Data.orgName}',
                    style: TextStyle(fontSize: 16)),
                Text('Owner Name: ${page3Data.ownerName}',
                    style: TextStyle(fontSize: 16)),
                Text('Owner Phone No: ${page3Data.ownerPhoneNo}',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                const Text('Bank Details:',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                Text('Account Type: ${page4Data.bankAccountType}',
                    style: TextStyle(fontSize: 16)),
                Text('Account Holder Name: ${page4Data.accountHolderName}',
                    style: TextStyle(fontSize: 16)),
                Text('Account Number: ${page4Data.bankAccountNo}',
                    style: TextStyle(fontSize: 16)),
                Text('IFSC Code: ${page4Data.ifscCode}',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey.shade800)),
                      onPressed: () {
                        // Clear the API error message when the "Back" button is pressed
                        Provider.of<MechanicDataProvider>(context, listen: false)
                            .clearApiErrorMessage();

                        Navigator.pop(context);
                      },
                      child: const Text('Back'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey.shade800)),
                      onPressed: () {
                        _submitForm(context);
                      },
                      child: const Text('Submit KYC'),
                    ),
                  ],
                ),
                Consumer<MechanicDataProvider>(
                    builder: (context, dataProvider, child) {
                  // Get the API error message from the data provider
                  final apiErrorMessage = dataProvider.apiErrorMessage;

                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        apiErrorMessage, // Display the API error message,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
