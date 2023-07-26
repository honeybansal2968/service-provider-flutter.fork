

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../components/my_button_2.dart';
import '../../../models/mechanic_data_model.dart';
import '../../../provider/mechanic_data_provider.dart';
import 'machanic_page4.dart';

class MachanicPage3 extends StatefulWidget {
  const MachanicPage3({Key? key}) : super(key: key);

  @override
  State<MachanicPage3> createState() => _MachanicPage3State();
}

class _MachanicPage3State extends State<MachanicPage3> {
  final _controllermachanicorgname = TextEditingController();
  final _controllermachanicshopname = TextEditingController();
  final _controllermachanicownername = TextEditingController();
  final _controllermachanicownerphoneno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 30),
            child: const Text(
              'Organization Details',
              style: TextStyle(color: Colors.black, fontSize: 28),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 35, right: 35),
                child: Column(
                  children: [
                    const SizedBox(height: 20), //1
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Organization Name:',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextField(
                      controller: _controllermachanicorgname,
                      style: const TextStyle(),
                      //obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color(0XFFe8f7f0),
                        filled: true,
                        hintText: "Name of org",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), //2
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Workshop Name:',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextField(
                      controller: _controllermachanicshopname,
                      style: const TextStyle(),
                      // obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color(0XFFe8f7f0),
                        filled: true,
                        hintText: "Shop Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), //3
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Owner Name:',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextField(
                      controller: _controllermachanicownername,
                      style: const TextStyle(),
                      //obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color(0XFFe8f7f0),
                        filled: true,
                        hintText: "Owner Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), //4
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Owner Mobile No:',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextField(
                      controller: _controllermachanicownerphoneno,
                      style: const TextStyle(),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        fillColor: const Color(0XFFe8f7f0),
                        filled: true,
                        hintText: "Owner Mobile No",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), //5
                    MyButton2(
                      text: 'Next',
                      onTap: () {
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

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MachanicPage4(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
