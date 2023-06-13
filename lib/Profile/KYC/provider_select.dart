import 'package:authentication/Profile/KYC/Mechanic%20KYC/mechanic_path.dart';
import 'package:authentication/components/my_button.dart';
import 'package:authentication/global_var.dart';
import 'package:flutter/material.dart';

class ProviderSelect extends StatefulWidget {
  ProviderSelect({super.key});

  @override
  State<ProviderSelect> createState() => _ProviderSelectState();
}

class _ProviderSelectState extends State<ProviderSelect> {
  // text editing controllers
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/register.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
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
                            MyButton(
                              text: 'mechanic',
                              onTap: () {
                                providerType = 'mechanic';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MechanicKYCPath(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 40),
                            MyButton(
                              text: 'cleaner',
                              onTap: () {
                                providerType = 'cleaner';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MechanicKYCPath(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 40),
                            MyButton(
                              text: 'driver',
                              onTap: () {
                                providerType = 'driver';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MechanicKYCPath(),
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
        ),
      ),
    );
  }
}
