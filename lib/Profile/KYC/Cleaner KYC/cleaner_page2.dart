import 'package:authentication/Profile/KYC/Cleaner%20KYC/cleaner_page3.dart';
import 'package:authentication/components/my_button_2.dart';
import 'package:flutter/material.dart';

class CleanerPage2 extends StatefulWidget {
  const CleanerPage2({super.key});

  @override
  State<CleanerPage2> createState() => _CleanerPage2State();
}

class _CleanerPage2State extends State<CleanerPage2> {
  // text editing controllers
  final _controllercleaneradharno = TextEditingController();
  final _controllercleanerdl = TextEditingController();
  final _controllercleanerpancard = TextEditingController();
  final _controllercleanerworkshopid = TextEditingController();
  late String cleaneradharno;
  late String cleanerdl;
  late String cleanerpancard;
  late String cleanerworkshopid;

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
                          controller: _controllercleaneradharno,
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
                          controller: _controllercleanerdl,
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
                          controller: _controllercleanerpancard,
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
                          controller: _controllercleanerworkshopid,
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
                              cleaneradharno = _controllercleaneradharno.text;
                              cleanerdl = _controllercleanerdl.text;
                              cleanerpancard = _controllercleanerpancard.text;
                              cleanerworkshopid =
                                  _controllercleanerworkshopid.text;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CleanerPage3(),
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
