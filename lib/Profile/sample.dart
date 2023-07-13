import 'package:authentication/components/my_button_2.dart';
import 'package:flutter/material.dart';

class SampleKYC extends StatefulWidget {
  SampleKYC({super.key});

  @override
  State<SampleKYC> createState() => _SampleKYCState();
}

class _SampleKYCState extends State<SampleKYC> {
  // text editing controllers
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF20B25B),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 30),
            child: const Text(
              'Select\nOne from below',
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'mobile:',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          style: const TextStyle(),
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: const Color(0XFFe8f7f0),
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(height: 40),
                        MyButton2(
                          text: 'cleaner',
                          onTap: () {},
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              backgroundColor: Colors.green[300],
                              fixedSize: const Size.fromHeight(45)),
                          child: const Text('Reject!'),
                          onPressed: () {
                            // Handle button 2 press
                          },
                        ),
                        const Text(
                          'Upload KYC',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 33,
                              fontWeight: FontWeight.w400),
                        )
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
