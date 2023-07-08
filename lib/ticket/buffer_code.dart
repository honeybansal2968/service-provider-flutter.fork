import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
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

class _SampleState extends State<Sample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Under Working'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: const AssetImage('lib/assets/images/towtruck.png'),
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: ExpansionTile(
                    title: const Text('Client Details'),
                    initiallyExpanded: _isExpanded,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _isExpanded = expanded;
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  return itemProfile(
                                    details[index],
                                    userDetailsMapping[index](user),
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: ExpansionTile(
                    title: const Text('Service Log'),
                    initiallyExpanded: _isExpanded,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _isExpanded = expanded;
                      });
                    },
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'exact function of this yet to be decided as to how backend proceeds, or the things mechanic would be able to do',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: ExpansionTile(
                    title: const Text('Payment Details'),
                    initiallyExpanded: _isExpanded,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _isExpanded = expanded;
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  return itemProfile(
                                    details[index],
                                    userDetailsMapping[index](user),
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
                    ],
                  ),
                ),
              ),
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
                        backgroundColor: Colors.green[300],
                        fixedSize: const Size.fromHeight(45),
                      ),
                      child: const Text('Completed!'),
                      onPressed: () {
                        // Handle button 2 press
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
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      tileColor: Colors.white,
    );
  }

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
