

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../components/my_button_2.dart';
import '../../../components/my_text_form_field.dart';
import '../../../helper_functions/validator.dart';
import '../../../models/mechanic_data_model.dart';
import '../../../provider/mechanic_data_provider.dart';
import 'machanic_page1.dart';
import 'machanic_page4.dart';

class MachanicPage3 extends StatefulWidget {

  final NextPageCallback onNextPage;

  const MachanicPage3({Key? key,required this.onNextPage}) : super(key: key);

  @override
  State<MachanicPage3> createState() => _MachanicPage3State();
}

class _MachanicPage3State extends State<MachanicPage3> {
  final _controllermachanicorgname = TextEditingController();
  final _controllermachanicshopname = TextEditingController();
  final _controllermachanicownername = TextEditingController();
  final _controllermachanicownerphoneno = TextEditingController();
  double dist = 10;


  // keys
  final _key = GlobalKey<FormState>();
  // focusNodes
  final phoneFocus = FocusNode();
  final emailFocus = FocusNode();
  final pincodeFocus = FocusNode();
  final addressFocus = FocusNode();

  // nextFocus
  void nextFocus(FocusNode node) => node.requestFocus();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: dist),

                const Text(
                  'Organization Details',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),

                SizedBox(height: dist),

                MyTextFormField(
                  controller: _controllermachanicorgname,
                  onFieldSubmitted: (_) => nextFocus(phoneFocus),
                  label: "Organization Name:",
                  hintText: "Enter Organization Name",
                  validator: (name) {
                    if (name != null && name.trim().isNotEmpty) return null;
                    return "Please enter name";
                  },
                ),
                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicshopname,
                  onFieldSubmitted: (_) => nextFocus(phoneFocus),
                  label: "Workshop Name:",
                  hintText: "Enter Workshop Name:",
                  validator: (name) {
                    if (name != null && name.trim().isNotEmpty) return null;
                    return "Please enter name";
                  },
                ),

                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicownername,
                  onFieldSubmitted: (_) => nextFocus(phoneFocus),
                  label: "Owner Name:",
                  hintText: "Enter Owner Name",
                  validator: (name) {
                    if (name != null && name.trim().isNotEmpty) return null;
                    return "Please enter name";
                  },
                ),

                SizedBox(height: dist),

                MyTextFormField(
                  controller: _controllermachanicownerphoneno,
                  focusNode: phoneFocus,
                  label: "Owner Mobile No:",
                  hintText: "Enter Owner Mobile Number",
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                  maxLength: 10,
                  validator: mobileValidate,
                ),

                SizedBox(height: dist),

                MyButton2(
                  text: 'Next',
                  onTap: () {


                    if(_key.currentState !=null && _key.currentState!.validate()){
                      print("Validated");

                      final dataProvider =
                      Provider.of<MechanicDataProvider>(context,
                          listen: false);

                      final page3Data = MechanicPage3Data(
                        organizationName: _controllermachanicorgname.text,
                        ownerName: _controllermachanicshopname.text,
                        workshopName: _controllermachanicownername.text,
                        ownerPhoneNumber: _controllermachanicownerphoneno.text,
                      );

                      dataProvider.updatePage3Data(page3Data);
                      widget.onNextPage(); // Call the callback to switch tabs



                    }


                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MachanicPage4(),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
