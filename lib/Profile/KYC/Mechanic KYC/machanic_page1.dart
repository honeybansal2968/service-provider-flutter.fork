import 'package:authentication/components/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../components/my_button_2.dart';
import '../../../helper_functions/validator.dart';
import '../../../models/mechanic_data_model.dart';
import '../../../provider/mechanic_data_provider.dart';
import 'machanic_page2.dart';

typedef NextPageCallback = void Function();



class MachanicPage1 extends StatefulWidget {
  final NextPageCallback onNextPage;

  const MachanicPage1({Key? key, required this.onNextPage}) : super(key: key);

  @override
  State<MachanicPage1> createState() => _MachanicPage1State();
}

class _MachanicPage1State extends State<MachanicPage1> {


  final _controllermachanicname = TextEditingController();
  final _controllermachanicmobileno = TextEditingController();
  final _controllermachanicemailid = TextEditingController();
  final _controllermachanicaddress = TextEditingController();
  final _controllermachanicpincode = TextEditingController();
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
                  'Enter Your Details',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),

                SizedBox(height: dist),

                MyTextFormField(
                  controller: _controllermachanicname,
                  onFieldSubmitted: (_) => nextFocus(phoneFocus),
                  label: "Full Name",
                  hintText: "Enter name",
                  validator: (name) {
                    if (name != null && name.trim().isNotEmpty) return null;
                    return "Please enter name";
                  },
                ),
                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicmobileno,
                  focusNode: phoneFocus,
                  onFieldSubmitted: (_) => nextFocus(emailFocus),
                  label: "Mobile No:",
                  hintText: "Enter mobile number",
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                  maxLength: 10,
                  validator: mobileValidate,
                ),
                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicemailid,
                  focusNode: emailFocus,
                  onFieldSubmitted: (_) => nextFocus(addressFocus),
                  label: "Email Id:",
                  hintText: "Enter email",
                  validator: emailValidator,
                ),
                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicaddress,
                  focusNode: addressFocus,
                  onFieldSubmitted:(_) => nextFocus(pincodeFocus) ,
                  textInputAction: TextInputAction.done,
                  label: "Address",
                  hintText: "Enter address",
                  maxLines: 4,
                ),
                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicpincode,
                  focusNode: pincodeFocus,
                  label: "Pin Code",
                  hintText: "Enter your Pin Code",
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                ),
                SizedBox(height: dist),

                MyButton2(
                  text: 'Next',
                  onTap: () {

                    if(_key.currentState !=null && _key.currentState!.validate())

                      {
                        final dataProvider =
                        Provider.of<MechanicDataProvider>(context,
                            listen: false);

                        final page1Data = MechanicPage1Data(
                          mechanicName: _controllermachanicname.text,
                          mechanicMobileNo:
                          _controllermachanicmobileno.text,
                          mechanicEmailId:
                          _controllermachanicemailid.text,
                          mechanicAddress:
                          _controllermachanicaddress.text,
                          mechanicPinCode:
                          _controllermachanicpincode.text,
                        );

                        dataProvider.updatePage1Data(page1Data);



                        widget.onNextPage(); // Call the callback to switch tabs

                      }



                    // _tabController.animateTo(_tabController.index + 1);


                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MachanicPage2(),
                    //   ),
                    // );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
