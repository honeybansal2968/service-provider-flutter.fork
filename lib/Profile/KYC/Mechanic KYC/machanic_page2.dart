import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../components/my_button_2.dart';
import '../../../components/my_text_form_field.dart';
import '../../../models/mechanic_data_model.dart';
import '../../../provider/mechanic_data_provider.dart';
import 'machanic_page1.dart';

class MachanicPage2 extends StatefulWidget {
  final NextPageCallback onNextPage;

  MachanicPage2({Key? key, required this.onNextPage}) : super(key: key);

  @override
  State<MachanicPage2> createState() => _MachanicPage2State();
}

class _MachanicPage2State extends State<MachanicPage2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _key = GlobalKey<FormState>();

  final _controllermachanicadharno = TextEditingController();
  final _controllermachanicdl = TextEditingController();
  final _controllermachanicpancard = TextEditingController();
  final _controllermachanicworkshopid = TextEditingController();
  double dist = 10;

  @override
  void initState() {
    super.initState();

    // Fetch the DocumentDetails data from the provider
    final dataProvider =
        Provider.of<MechanicDataProvider>(context, listen: false);
    final page2Data = dataProvider.page2Data;

    // Autofill the TextEditingControllers with page2Data
    _controllermachanicadharno.text = page2Data.aadhaarNo ?? '';
    _controllermachanicdl.text = page2Data.drivingLicenceNo ?? '';
    _controllermachanicpancard.text = page2Data.panCardNo ?? '';
  }

  // focusNodes
  final dlFocus = FocusNode();
  final panFocus = FocusNode();
  final adhaarFocus = FocusNode();
  final workidFocus = FocusNode();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: dist),
                const Text(
                  'Enter Documents Details',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicadharno,
                  focusNode: adhaarFocus,
                  onFieldSubmitted: (_) => nextFocus(dlFocus),
                  label: "Adhaar No:",
                  hintText: "Enter  Adhaar No",
                  keyboardType: TextInputType.number,
                  validator: (num) {
                    if (num != null && num.trim().isNotEmpty) return null;
                    return "Please Enter Data";
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                  maxLength: 12,
                ),
                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicdl,
                  focusNode: dlFocus,
                  onFieldSubmitted: (_) => nextFocus(panFocus),
                  label: "Driving Licence:",
                  hintText: "Enter Driving Licence No.",
                  validator: (num) {
                    if (num != null && num.trim().isNotEmpty) return null;
                    return "Please Enter Data";
                  },
                ),
                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicpancard,
                  focusNode: panFocus,
                  onFieldSubmitted: (_) => nextFocus(workidFocus),
                  label: "PAN Card:",
                  hintText: "Enter PAN Card No.",
                  validator: (num) {
                    if (num != null && num.trim().isNotEmpty) return null;
                    return "Please Enter Data";
                  },
                ),
                SizedBox(height: dist),
                MyTextFormField(
                  controller: _controllermachanicworkshopid,
                  focusNode: workidFocus,
                  label: "Workshop ID:",
                  hintText: "Optional",
                ),
                SizedBox(height: dist),
                MyButton2(
                  text: 'Save & Next',
                  onTap: () {
                    if (_key.currentState != null &&
                        _key.currentState!.validate()) {
                      final dataProvider = Provider.of<MechanicDataProvider>(
                          context,
                          listen: false);

                      final page2Data = DocumentDetails(
                        aadhaarNo: _controllermachanicadharno.text,
                        drivingLicenceNo: _controllermachanicdl.text,
                        panCardNo: _controllermachanicpancard.text,
                      );

                      dataProvider.updatePage2Data(page2Data);

                      widget.onNextPage(); // Call the callback to switch tabs
                    }

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MachanicPage3(),
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
