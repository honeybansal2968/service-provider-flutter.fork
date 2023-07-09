import 'package:authentication/Profile/KYC/Driver%20KYC/driver_page3.dart';
import 'package:authentication/components/my_button_2.dart';
import 'package:flutter/material.dart';

class DriverPage2 extends StatefulWidget {
  const DriverPage2({super.key});

  @override
  State<DriverPage2> createState() => _DriverPage2State();
}

class _DriverPage2State extends State<DriverPage2> {
  // text editing controllers
  final _controllerdriveradharno = TextEditingController();
  final _controllerdriverdl = TextEditingController();
  final _controllerdriverpancard = TextEditingController();
  final _controllerdriverworkshopid = TextEditingController();
  late String driveradharno;
  late String driverdl;
  late String driverpancard;
  late String driverworkshopid;
  double dist = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 30),
            child: const Text(
              'Enter Documents Details',
              style: TextStyle(color: Colors.black, fontSize: 28),
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
                        const SizedBox(height: 20),
                        const Text(
                          'Adhaar:                                                                      ',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          controller: _controllerdriveradharno,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: const Color(0XFFe8f7f0),
                              filled: true,
                              hintText: "Adhaar No.",
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(height: dist),
                        const Text(
                          'Driving Liscence:                                                                      ',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          controller: _controllerdriverdl,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: const Color(0XFFe8f7f0),
                              filled: true,
                              hintText: "Driving Liscence No.",
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(height: dist),
                        const Text(
                          'PAN Card:                                                                      ',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          controller: _controllerdriverpancard,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: const Color(0XFFe8f7f0),
                              filled: true,
                              hintText: "PAN No.",
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(height: dist),
                        const Text(
                          'Workshop id:                                                                      ',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          controller: _controllerdriverworkshopid,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: const Color(0XFFe8f7f0),
                              filled: true,
                              hintText: "Optional",
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(height: 120),
                        MyButton2(
                          text: 'Next',
                          onTap: () {
                            setState(() {
                              driveradharno = _controllerdriveradharno.text;
                              driverdl = _controllerdriverdl.text;
                              driverpancard = _controllerdriverpancard.text;
                              driverworkshopid =
                                  _controllerdriverworkshopid.text;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DriverPage3(),
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
