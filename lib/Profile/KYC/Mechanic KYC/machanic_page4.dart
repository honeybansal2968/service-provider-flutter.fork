import 'package:authentication/Profile/KYC/Mechanic%20KYC/review_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../components/my_button_2.dart';
import '../../../components/my_text_form_field.dart';
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


