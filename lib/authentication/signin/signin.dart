import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 244, 246, 1),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: size.width,
            child: Card(
              color: Colors.white,
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset("images/main-logo.png", height: 55, width: 55),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Login to your account",
                  style: GoogleFonts.getFont("Open Sans",
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                    text: "Don't have an account yet?",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: " Sign up",
                    style: GoogleFonts.getFont("Open Sans",
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(22, 163, 74, 1)),
                  )
                ])),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    width: 280,
                    child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 0, 109, 252))),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 201, 201, 201),
                                    width: 1.4)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 14),
                            border: const OutlineInputBorder(),
                            labelText: "Phone Number*",
                            floatingLabelStyle: GoogleFonts.getFont("Open Sans",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 0, 109, 252)),
                            labelStyle: GoogleFonts.getFont("Open Sans",
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color.fromARGB(255, 100, 98, 98))))),
                const SizedBox(
                  height: 20,
                ),
                const Text('Send OTP',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(126, 126, 126, 1),
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Color.fromRGBO(126, 126, 126, 1))),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: const BoxDecoration(),
                    width: 285,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(143, 225, 173, 1)),
                        onPressed: () {},
                        child: Text("Submit",
                            style: GoogleFonts.getFont(
                              "Open Sans",
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )))),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 2,
                  width: 315,
                  color: const Color.fromARGB(255, 236, 231, 231),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Or, you can also sign in with Google!",
                  style: GoogleFonts.getFont("Open Sans",
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 280,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(34, 197, 94, 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "/icons/google.svg",
                            height: 22,
                            width: 22,
                          ),
                          Text(
                            "Continue with Google",
                            style: GoogleFonts.getFont("Open Sans",
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 1,
                          )
                        ],
                      )),
                )
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
