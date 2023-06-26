import 'package:authentication/Profile/KYC/provider_select.dart';
import 'package:authentication/Profile/userhelp.dart';
import 'package:authentication/Profile/userprofile.dart';
import 'package:authentication/Profile/usersetting.dart';
import 'package:authentication/Profile/userterms.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200.0,
            width: double.infinity,
            child: Image.network(
              'https://images.unsplash.com/photo-1615906655593-ad0386982a0f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'Mechanic Name( ID 8080)',
            style: TextStyle(
                fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '4.9 user rating',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Icon(
          //   Icons.location_on,
          //   color: Colors.black,
          //   size: 30.0,
          // ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: (index == 0)
                          ? const Icon(Icons.person)
                          : (index == 1)
                              ? const Icon(Icons.settings)
                              : (index == 2)
                                  ? const Icon(Icons.help_outline)
                                  : (index == 3)
                                      ? const Icon(Icons.verified)
                                      : const Icon(Icons.description),
                      title: (index == 0)
                          ? const Text('My Profile')
                          : (index == 1)
                              ? const Text('Settings')
                              : (index == 2)
                                  ? const Text('Help & Support')
                                  : (index == 3)
                                      ? const Text('KYC')
                                      : const Text('Terms & Conditions'),
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserProfile()));
                        } else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserSetting()));
                        } else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UserHelpSupport()));
                        } else if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProviderSelect()));
                          // code to share the app
                        } else if (index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UserTermsCondition()));
                          // code to show the Terms & Conditions
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          )),
        ],
      ),
    );
  }
}
