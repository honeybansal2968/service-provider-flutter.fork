import 'package:authentication/Profile/KYC/Cleaner%20KYC/cleaner_page4.dart';
import 'package:authentication/components/my_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CleanerPage3 extends StatefulWidget {
  const CleanerPage3({Key? key}) : super(key: key);

  @override
  State<CleanerPage3> createState() => _CleanerPage3State();
}

class _CleanerPage3State extends State<CleanerPage3> {
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
                      style: const TextStyle(),
                      //obscureText: true,
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
                        'Owner Number:',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: const TextStyle(),
                      //obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color(0XFFe8f7f0),
                        filled: true,
                        hintText: "Phone No",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 120),
                    MyButton2(
                      text: 'Next',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CleanerPage4(),
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
