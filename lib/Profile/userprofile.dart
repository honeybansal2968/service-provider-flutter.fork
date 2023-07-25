import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Profile', style: TextStyle(fontSize: 30)),
              FutureBuilder(
                future: getUserDetails(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final userDetails = snapshot.data as UserDetails;
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        const SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(userDetails.imageUrl),
                        ),
                        const Row(
                          children: [
                            Text('User Description',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(10.0)),
                          width: MediaQuery.of(context).size.width - 25,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'This is the info for Rohit Barate, a mechanic from New York, NY with license number JD-123',

                            // 'User Description: ${userDetails?.desc}',
                          ),
                        ),
                        const SizedBox(height: 20),
                        itemProfile('Name', userDetails.mechanicName,
                            CupertinoIcons.person),
                        const SizedBox(height: 10),
                        itemProfile(
                            'Phone', '03107085816', CupertinoIcons.phone),
                        const SizedBox(height: 10),
                        itemProfile('Company Address', userDetails.location,
                            CupertinoIcons.location),
                        const SizedBox(height: 10),
                        itemProfile(
                            'Company Name',
                            '${userDetails.companyName}, ',
                            CupertinoIcons.building_2_fill),
                        const SizedBox(height: 10),
                        itemProfile('Email', 'ahadhashmideveloper@gmail.com',
                            CupertinoIcons.mail),
                        const SizedBox(height: 10),
                        itemProfile('Mechanic ID', ' ${userDetails.mechanicID}',
                            CupertinoIcons.creditcard_fill),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15),
                              ),
                              child: const Text('Edit Profile')),
                        ),
                      ]),
                    );
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: SizedBox(
                    //     height: 160,
                    //     child: Card(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20.0)),
                    //       child: Row(
                    //         children: [
                    //           CircleAvatar(
                    //             radius: 60,
                    //             backgroundImage:
                    //                 NetworkImage(userDetails.imageUrl),
                    //           ),
                    //           const SizedBox(width: 40),
                    //           // Expanded(
                    //           //   child: Column(
                    //           //     mainAxisSize: MainAxisSize.min,
                    //           //     crossAxisAlignment: CrossAxisAlignment.start,
                    //           //     children: [
                    //           //       Text(
                    //           //         userDetails.mechanicName,
                    //           //         style: const TextStyle(fontSize: 20),
                    //           //       ),
                    //           //       Text(
                    //           //         '${userDetails.companyName}, ',
                    //           //         style: const TextStyle(fontSize: 16),
                    //           //       ),
                    //           //       Text(
                    //           //         userDetails.location,
                    //           //         style: const TextStyle(
                    //           //           fontSize: 16,
                    //           //           fontWeight: FontWeight.bold,
                    //           //           color: Colors.blue,
                    //           //         ),
                    //           //       ),
                    //           //       Text(
                    //           //         'Mechanic ID: ${userDetails.mechanicID}',
                    //           //         style: TextStyle(fontSize: 16),
                    //           //       ),
                    //           //     ],
                    //           //   ),
                    //           // ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              // const Row(
              //   children: [
              //     Text('User Description', style: TextStyle(fontSize: 20)),
              //   ],
              // ),
              // const SizedBox(height: 5),
              // Container(
              //   child: SingleChildScrollView(
              //     child: Expanded(
              //         child: Expanded(
              //             child: Column(
              //       children: <Widget>[
              //         Row(
              //           children: [
              //             Text(
              //               'Hello! This is the description',
              //               overflow: TextOverflow
              //                   .ellipsis, //Only show two or three lines
              //             ),
              //           ],
              //         ),
              //         ElevatedButton(
              //           child: Text('More'),
              //           // color: Colors.lightBlueAccent, //Style the button
              //           // highlightElevation: 10.0,
              //           onPressed: () {},
              //         )
              //       ],
              //     ))),
              //   ),
              // ),
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              //   decoration: BoxDecoration(
              //       color: Colors.blue[50],
              //       borderRadius: BorderRadius.circular(10.0)),
              //   width: MediaQuery.of(context).size.width - 25,
              //   alignment: Alignment.centerLeft,
              //   child: const Text(
              //     'This is the info for Rohit Barate, a mechanic from New York, NY with license number JD-123',

              //     // 'User Description: ${userDetails?.desc}',
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.blue.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        // trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}

class UserDetails {
  final String mechanicName;
  final String companyName;
  final String location;
  final String mechanicID;
  final String imageUrl;
  final String desc;

  // Set initial values here
  UserDetails(this.mechanicName, this.companyName, this.location,
      this.mechanicID, this.imageUrl, this.desc);
}

// Connect the database or API here to get the user details
Future<UserDetails> getUserDetails() async {
  await Future.delayed(const Duration(seconds: 3));
  return UserDetails(
    'Rohit Barate',
    'Super Man Mechanic',
    'New Delhi, IN',
    '808080',
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'This is the info for Rohit Barate, a mechanic from New York, NY with license number JD-123',
  );
}
