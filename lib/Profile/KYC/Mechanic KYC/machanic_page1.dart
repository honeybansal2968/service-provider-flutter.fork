import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_button_2.dart';
import '../../../models/mechanic_data_model.dart';
import '../../../provider/mechanic_data_provider.dart';
import 'machanic_page2.dart';


class MachanicPage1 extends StatefulWidget {
  const MachanicPage1({Key? key}) : super(key: key);

  @override
  State<MachanicPage1> createState() => _MachanicPage1State();
}

class _MachanicPage1State extends State<MachanicPage1> {
  final _controllermachanicname = TextEditingController();
  final _controllermachanicmobileno = TextEditingController();
  final _controllermachanicemailid = TextEditingController();
  final _controllermachanicaddress = TextEditingController();
  final _controllermachanicpincode = TextEditingController();
  double dist = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 30),
            child: const Text(
              'Enter Your Details',
              style: TextStyle(color: Colors.black, fontSize: 26),
              textAlign: TextAlign.left,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        const Text(
                          'Name:                                                                      ',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          controller: _controllermachanicname,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: const Color(0XFFe8f7f0),
                              filled: true,
                              hintText: 'your name',
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(height: dist),
                        const Text(
                          'Mobile No.:                                                                      ',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          controller: _controllermachanicmobileno,
                          style: const TextStyle(),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor: const Color(0XFFe8f7f0),
                              filled: true,
                              hintText: 'your adhaar linked mobile No.',
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(height: dist),
                        const Text(
                          'Email id:                                                                      ',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          controller: _controllermachanicemailid,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: const Color(0XFFe8f7f0),
                              filled: true,
                              hintText: 'Email address',
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(height: dist),
                        const Text(
                          'Address:                                                                      ',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          controller: _controllermachanicaddress,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: const Color(0XFFe8f7f0),
                              filled: true,
                              hintText: 'local area address',
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(height: dist),
                        const Text(
                          'Pin Code:                                                                      ',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          controller: _controllermachanicpincode,
                          style: const TextStyle(),
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor: const Color(0XFFe8f7f0),
                              filled: true,
                              hintText: 'your area pin code',
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(height: dist),
                        MyButton2(
                          text: 'Next',
                          onTap: () {
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

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MachanicPage2(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
