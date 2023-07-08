import 'package:authentication/ticket/buffer_code.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PopupOTP extends StatefulWidget {
  PopupOTP({super.key});

  @override
  State<PopupOTP> createState() => _PopupOTPState();
}

class _PopupOTPState extends State<PopupOTP> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 80,
                height: 8,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Verify customer OTP',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Pinput(
                onCompleted: (pin) => print(pin),
                defaultPinTheme: defaultPinTheme,
                controller: otpController,
                length: 4,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Resend',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 100),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Request the customer for a 4 digit OTP , to ensure u have met the right person',
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 1,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size.fromHeight(45)),
                  child: const Text(
                    'Back!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.green[500],
                      fixedSize: const Size.fromHeight(45)),
                  child: const Text('Confirm'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Sample(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 50,
  height: 50,
  textStyle: const TextStyle(fontSize: 20, color: Colors.black12),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black12),
    borderRadius: BorderRadius.circular(20),
  ),
);
