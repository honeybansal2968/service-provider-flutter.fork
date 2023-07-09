import 'package:authentication/Profile/KYC/Cleaner%20KYC/cleaner_page2.dart';
import 'package:authentication/components/my_button_2.dart';
import 'package:flutter/material.dart';

class CleanerPage1 extends StatefulWidget {
  const CleanerPage1({super.key});

  @override
  State<CleanerPage1> createState() => _CleanerPage1State();
}

class _CleanerPage1State extends State<CleanerPage1> {
  // text editing controllers
  final _controllercleanername = TextEditingController();
  final _controllercleanermobileno = TextEditingController();
  final _controllercleaneremailid = TextEditingController();
  final _controllercleaneraddress = TextEditingController();
  final _controllercleanerpincode = TextEditingController();
  late String cleanername;
  late String cleanermobileno;
  late String cleaneremailid;
  late String cleaneraddress;
  late String cleanerpincode;
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
                          controller: _controllercleanername,
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
                          controller: _controllercleanermobileno,
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
                          controller: _controllercleaneremailid,
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
                          controller: _controllercleaneraddress,
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
                          controller: _controllercleanerpincode,
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
                            setState(() {
                              cleanername = _controllercleanername.text;
                              cleanermobileno = _controllercleanermobileno.text;
                              cleaneremailid = _controllercleaneremailid.text;
                              cleaneraddress = _controllercleaneraddress.text;
                              cleanerpincode = _controllercleanerpincode.text;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CleanerPage2(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
