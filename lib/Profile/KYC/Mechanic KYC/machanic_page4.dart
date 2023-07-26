import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../apis/michanic_api.dart';
import '../../../components/my_button_2.dart';
import '../../../models/mechanic_data_model.dart';
import '../../../provider/mechanic_data_provider.dart';

class MachanicPage4 extends StatefulWidget {
  const MachanicPage4({Key? key}) : super(key: key);

  @override
  State<MachanicPage4> createState() => _MachanicPage4State();
}


class _MachanicPage4State extends State<MachanicPage4> {
  final _controllermachnaicaccholdername = TextEditingController();
  final _controllermachanicaccno = TextEditingController();
  final _controllermachanicownerifsccode = TextEditingController();

  // A variable to hold the selected account type
  var accountType = '';


  void _submitForm() async {
    final dataProvider = Provider.of<MechanicDataProvider>(context, listen: false);

    final page1Data = dataProvider.page1Data;
    final page2Data = dataProvider.page2Data;
    final page3Data = dataProvider.page3Data;
    final page4Data = MechanicPage4Data(
      accountType: accountType,
      accountHolderName: _controllermachnaicaccholdername.text,
      accountNumber: _controllermachanicaccno.text,
      ifscCode: _controllermachanicownerifsccode.text,
    );

    final mechanicData = MechanicDataModel(
      page1Data: page1Data,
      page2Data: page2Data,
      page3Data: page3Data,
      page4Data: page4Data,
    );
    print(page4Data.accountHolderName);
    print(mechanicData.page1Data.mechanicEmailId);

    final success = await MechanicAPI.submitMechanicData(mechanicData);


    if (success) {
      // API call was successful
      print('Data sent successfully!');

      // Clear the data in the data provider after successful submission
      dataProvider.updatePage1Data(MechanicPage1Data(
        mechanicName: '',
        mechanicMobileNo: '',
        mechanicEmailId: '',
        mechanicAddress: '',
        mechanicPinCode: '',
      ));
      dataProvider.updatePage2Data(MechanicPage2Data(
        mechanicAdharNo: '',
        mechanicDL: '',
        mechanicPAN: '',
        mechanicWorkshopId: '',
      ));
      dataProvider.updatePage3Data(MechanicPage3Data(
        organizationName: '',
        workshopName: '',
        ownerName: '',
        ownerPhoneNumber: '',
      ));
      dataProvider.updatePage4Data(MechanicPage4Data(
        accountType: '',
        accountHolderName: '',
        accountNumber: '',
        ifscCode: '',
      ));

      // Clear the text fields after submitting
      _controllermachnaicaccholdername.clear();
      _controllermachanicaccno.clear();
      _controllermachanicownerifsccode.clear();

      // Navigate to the next screen or do something else here
    } else {
      // API call failed
      print('Failed to send data to the server.');
      // Handle the failure, e.g., show an error message to the user
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35, right: 35),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Enter Account Details',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Account Type:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    backgroundColor: Colors.green[300],
                                    fixedSize: const Size.fromHeight(45)),
                                child: const Text('Savings'),
                                onPressed: () {
                                  setState(() {
                                    accountType = 'Savings';
                                  });
                                },
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    backgroundColor: Colors.green[300],
                                    fixedSize: const Size.fromHeight(45)),
                                child: const Text('current'),
                                onPressed: () {
                                  setState(() {
                                    accountType = 'Current';
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20), //1
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Account Holder Name:',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      TextField(
                        controller: _controllermachnaicaccholdername,
                        style: const TextStyle(),
                        decoration: InputDecoration(
                          fillColor: const Color(0XFFe8f7f0),
                          filled: true,
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), //2
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Account Number:',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      TextField(
                        controller: _controllermachanicaccno,
                        style: const TextStyle(),
                        decoration: InputDecoration(
                          fillColor: const Color(0XFFe8f7f0),
                          filled: true,
                          hintText: "Account No.",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), //3
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'IFSC Code:',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      TextField(
                        controller: _controllermachanicownerifsccode,
                        style: const TextStyle(),
                        decoration: InputDecoration(
                          fillColor: const Color(0XFFe8f7f0),
                          filled: true,
                          hintText: "IFSC Code",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                      MyButton2(
                        text: 'Submit',
                        onTap: _submitForm



                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
