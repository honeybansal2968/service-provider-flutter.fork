import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../apis/michanic_api.dart';
import '../../../home/all_parts_integrated.dart';
import '../../../models/mechanic_data_model.dart';
import '../../../provider/mechanic_data_provider.dart';

class ReviewPage extends StatelessWidget {
  // Define the parameters for ReviewPage constructor
  final GeneralDetails page1Data;
  final DocumentDetails page2Data;
  final Organization page3Data;
  final BankDetails page4Data;

  ReviewPage({
    required this.page1Data,
    required this.page2Data,
    required this.page3Data,
    required this.page4Data,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MechanicDataProvider>(
      builder: (context, dataProvider, child) {
        final GeneralDetails page1Data = dataProvider.page1Data;
        final DocumentDetails page2Data = dataProvider.page2Data;
        final Organization page3Data = dataProvider.page3Data;
        final BankDetails page4Data = dataProvider.page4Data;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Review Data'),
            foregroundColor: Colors.black,
            backgroundColor: Colors.green.shade300,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: Colors.green.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'General Details',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Full Name: ${page1Data.fullName}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Mobile No: ${page1Data.phoneNo}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Email Id: ${page1Data.email}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Address: ${page1Data.address}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Pin Code: ${page1Data.pincode}',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Document Details',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Aadhaar No: ${page2Data.aadhaarNo}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Driving License No: ${page2Data.drivingLicenceNo}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Pan Card No: ${page2Data.panCardNo}',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Workshop Details',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Organization Name: ${page3Data.orgName}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Owner Name: ${page3Data.ownerName}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Owner Phone No: ${page3Data.ownerPhoneNo}',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Bank Details:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Account Type: ${page4Data.bankAccountType}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Account Holder Name: ${page4Data.accountHolderName}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Account Number: ${page4Data.bankAccountNo}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'IFSC Code: ${page4Data.ifscCode}',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
                          ),
                          onPressed: () {
                            // Clear the API error message when the "Back" button is pressed
                            dataProvider.clearApiErrorMessage();
                            Navigator.pop(context);
                          },
                          child: const Text('Back'),
                        ),
                        ElevatedButton(
                          onPressed: dataProvider.isLoading
                              ? null
                              : () async {
                            // Set isLoading to true before making the API call
                            dataProvider.isLoading = true;

                            final mechanicData = Mechanic(
                              role: "mechanic",
                              mechanicId: "",
                              generalDetails: page1Data,
                              documentDetails: page2Data,
                              workshopDetails: WorkshopDetails(organization: page3Data),
                              bankDetails: page4Data,
                            );

                            final response = await MechanicAPI.submitMechanicData(mechanicData);

                            if (response['success']) {
                              // API call was successful
                              print('Data sent successfully!');

                              // Set isLoading to false after the API call is complete
                              dataProvider.isLoading = false;

                              // Clear the data in the data provider after successful submission
                              dataProvider.updatePage1Data(GeneralDetails(
                                fullName: '',
                                phoneNo: '',
                                email: '',
                                address: '',
                                pincode: '',
                              ));
                              dataProvider.updatePage2Data(DocumentDetails(
                                aadhaarNo: '',
                                drivingLicenceNo: '',
                                panCardNo: '',
                              ));
                              dataProvider.updatePage3Data(Organization(
                                orgName: '',
                                ownerName: '',
                                ownerPhoneNo: '',
                              ));
                              dataProvider.updatePage4Data(BankDetails(
                                bankAccountType: '',
                                accountHolderName: '',
                                bankAccountNo: '',
                                ifscCode: '',
                              ));

                              // Show the success dialog using await
                              await showDialog(
                                context: context,
                                builder: (context) => SuccessDialog(
                                  message: 'Data saved successfully!',
                                  onClose: () {
                                    // No need to do anything here. The navigation will be handled by SuccessDialog.
                                  },
                                  destinationPage: IntegratedHome(), // Specify the destination page here
                                ),
                              );
                            } else {
                              dataProvider.isLoading = false;
                              print('Failed to send data to the server.');
                              dataProvider.updateApiErrorMessage(response['message']);
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (dataProvider.isLoading) CircularProgressIndicator(),
                              Text('Submit KYC'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (dataProvider.apiErrorMessage.isNotEmpty)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            dataProvider.apiErrorMessage,
                            // Display the API error message,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String message;
  final VoidCallback onClose; // New n
  final Widget destinationPage; // New parameter to specify the destination page

  SuccessDialog({required this.message, required this.onClose, required this.destinationPage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Success'),
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Call the provided onClose function when the "OK" button is pressed
            onClose();

            // Use the Navigator to navigate to the specified destination page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinationPage),
            );

            // The dialog will be automatically closed by Navigator
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
