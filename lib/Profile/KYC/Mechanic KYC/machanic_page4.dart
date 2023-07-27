import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../apis/michanic_api.dart';
import '../../../components/my_button_2.dart';
import '../../../components/my_text_form_field.dart';
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
  double dist = 10;

  // keys
  final _key = GlobalKey<FormState>();
  // focusNodes
  final nameFocus = FocusNode();
  final numberFocus = FocusNode();
  final ifscFocus = FocusNode();

  // nextFocus
  void nextFocus(FocusNode node) => node.requestFocus();


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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
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
                ),
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
                  text: 'Submit',
                  onTap: (){
                    print("clicked");
                    if(_key.currentState !=null && _key.currentState!.validate()){

                      print("Validated");

                      _submitForm();


                    }
                  }



                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
