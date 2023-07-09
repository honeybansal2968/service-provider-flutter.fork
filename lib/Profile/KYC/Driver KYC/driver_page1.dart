import 'package:authentication/Profile/KYC/Driver%20KYC/driver_page2.dart';
import 'package:authentication/components/my_button_2.dart';
import 'package:flutter/material.dart';

class DriverPage1 extends StatefulWidget {
  const DriverPage1({super.key});

  @override
  State<DriverPage1> createState() => _DriverPage1State();
}

class _DriverPage1State extends State<DriverPage1> {
  // text editing controllers
  final _controllerdrivername = TextEditingController();
  final _controllerdrivermobileno = TextEditingController();
  final _controllerdriveremailid = TextEditingController();
  final _controllerdriveraddress = TextEditingController();
  final _controllerdriverpincode = TextEditingController();
  late String drivername;
  late String drivermobileno;
  late String driveremailid;
  late String driveraddress;
  late String driverpincode;
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
                          controller: _controllerdrivername,
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
                          controller: _controllerdrivermobileno,
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
                          controller: _controllerdriveremailid,
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
                          controller: _controllerdriveraddress,
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
                          controller: _controllerdriverpincode,
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
                              drivername = _controllerdrivername.text;
                              drivermobileno = _controllerdrivermobileno.text;
                              driveremailid = _controllerdriveremailid.text;
                              driveraddress = _controllerdriveraddress.text;
                              driverpincode = _controllerdriverpincode.text;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DriverPage2(),
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
