import 'package:authentication/ticket/ticketafteracceptance.dart';
import 'package:flutter/material.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({Key? key}) : super(key: key);

  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

var details = [
  'Name:',
  'Problem:',
  'Description of problem:',
  'Live/scheduled status:',
  'Location:',
  'Distance from your location:',
  'Booking id:',
  'Price amount:',
  'Approx time req:'
];

List<String Function(UserDetails)> userDetailsMapping = [
  (user) => user.customerName,
  (user) => user.problem,
  (user) => user.problemDesc,
  (user) => user.scheduledStatus,
  (user) => user.location,
  (user) => user.distance,
  (user) => user.bookingId,
  (user) => user.priceAmount,
  (user) => user.approxTimeReq,
];

class _MoreDetailsState extends State<MoreDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('More Details'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: const AssetImage('lib/assets/images/towtruck.png'),
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder<UserDetails>(
                  future: getUserDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final user = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: details.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Colors.white10,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    itemProfile(
                                      details[index],
                                      userDetailsMapping[index](user),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error loading user details'),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.red[300],
                          fixedSize: const Size.fromHeight(45),
                        ),
                        child: const Text('Reject!'),
                        onPressed: () {
                          // Handle button 2 press
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: const Size.fromHeight(45),
                        ),
                        child: const Text(
                          'Accept',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // Handle button 1 press
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TicketAccepted(),
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
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle) {
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
        tileColor: Colors.white,
      ),
    );
  }
}

class UserDetails {
  final String customerName;
  final String bookingId;
  final String problem;
  final String problemDesc;
  final String scheduledStatus;
  final String location;
  final String distance;
  final String priceAmount;
  final String approxTimeReq;

  // Set initial values here
  UserDetails(
    this.customerName,
    this.bookingId,
    this.problem,
    this.problemDesc,
    this.scheduledStatus,
    this.location,
    this.distance,
    this.priceAmount,
    this.approxTimeReq,
  );
}

// Connect the database or API here to get the user details
Future<UserDetails> getUserDetails() async {
  await Future.delayed(const Duration(seconds: 3));
  return UserDetails(
    'Devansh Sengar',
    'UPGBN00216',
    'car not starting',
    'This is the problem description for the sample dataset of a customer experiencing a problem. Aims to describe the problem in detail for the mechanic to get a better grasp of the situation.',
    'Live',
    'Noida, 201110 (to be replaced by a better location structure)',
    '3.5 Km (to have logic here to show distance)',
    '799 (estimated)',
    'This is the info for Rohit Barate, a mechanic from New York, NY with license number JD-123',
  );
}
