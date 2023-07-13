import 'package:authentication/Profile/KYC/Mechanic%20KYC/machanic_page3.dart';
import 'package:authentication/components/my_button_2.dart';
import 'package:flutter/material.dart';

class MachanicPage2 extends StatefulWidget {
  const MachanicPage2({super.key});

  @override
  State<MachanicPage2> createState() => _MachanicPage2State();
}

class _MachanicPage2State extends State<MachanicPage2> {
  final _controllermachanicadharno = TextEditingController();
  final _controllermachanicdl = TextEditingController();
  final _controllermachanicpancard = TextEditingController();
  final _controllermachanicworkshopid = TextEditingController();
  late String machanicadharno;
  late String machanicdl;
  late String machanicpancard;
  late String machanicworkshopid;
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
                          controller: _controllermachanicadharno,
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
                          controller: _controllermachanicdl,
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
                          controller: _controllermachanicpancard,
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
                          controller: _controllermachanicworkshopid,
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
                              machanicadharno = _controllermachanicadharno.text;
                              machanicdl = _controllermachanicdl.text;
                              machanicpancard = _controllermachanicpancard.text;
                              machanicworkshopid =
                                  _controllermachanicworkshopid.text;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MachanicPage3(),
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
