import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Last Updated: August 8, 2023',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "At Helpy Moto, we take data privacy and security seriously to ensure a safe and trustworthy user experience for all our visitors and customers. To provide transparency, we want to share some important aspects of our data collection, sharing, and security practices.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              "Information Collection",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We use standard web-logging methods, including cookies, to gather information about our website visitors. This includes details such as pages accessed, time of access, IP addresses, referring website/URL, and browser details. This data is crucial for understanding user behavior, enhancing website performance, and providing personalized services. However, we maintain strict adherence to privacy guidelines, and this information is purged after 30 days, ensuring that we retain only the necessary data for a limited period.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              "Data Sharing",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We prioritize the confidentiality of user information and strictly adhere to a no-third-party sharing policy. Your data remains safe with us, and we do not relay any information about the pages you access on our website to external service providers like Facebook or Google. However, in some instances, data may be shared with other related companies/entities. This sharing is done solely for the purpose of developing marketing strategies and improving the website, ensuring we continue to enhance our services based on user needs and preferences.Additionally, it's important to note that we may share information with the Government if we are legally obligated to do so, ensuring compliance with relevant laws and regulations.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              "Data Security",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We prioritize the security of your personal information. We implement robust measures to safeguard the data we collect about our users. For instance, passwords are never stored in plaintext, adding an extra layer of protection against potential security breaches.We also restrict employee access to sensitive information, ensuring that only authorized personnel can handle such data. This practice minimizes the risk of unauthorized access and maintains the highest level of data protection.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              "System Security",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We understand the criticality of maintaining a secure infrastructure. To this end, we employ comprehensive firewall measures to protect our servers and databases from unauthorized access. This ensures that any sensitive information is kept safe and inaccessible to unauthorized parties.For purchases made on our website, we prioritize payment security by never storing credit/debit card details on our servers. Instead, we only store transaction authorization data, while the card details are securely recorded with the merchant bank. This approach minimizes the risk of financial data exposure and ensures secure transactions for our valued customers.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              "Additionally, we have a zero-tolerance policy towards any form of malpractice or misuse of our platform. In the event of any detected malpractice, strict actions will be taken, and the required amount will be deducted from the user's account. The calculated amount will be based on a fair assessment, considering factors such as the percentage of travel in our database and the type of service involved.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              "In summary, Data privacy and Security are fundamental pillars of our operations. We are committed to protect your information, employing industry best practices, and adhering to applicable laws and regulations. By Implementing these measures, we aim to provide you with a safe and seamless experience on our platform.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
