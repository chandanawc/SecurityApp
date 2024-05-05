import 'package:flutter/material.dart';

class CyberLawsPage extends StatelessWidget {
  bool showDetails = false;

  void toggleDetails(BuildContext context) {
    showDetails = !showDetails;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(showDetails ? 'Show Cyber Laws' : 'Hide Cyber Laws')),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cyber Laws'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            //@@@@@@
            Text(
              'Cyber laws:',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Cyber laws, also known as cybersecurity laws or information security laws, are a set of legal frameworks and regulations designed to address and govern activities related to cyberspace, data protection, and information security. These laws aim to protect individuals, organizations, and governments from cyber threats and ensure the proper use and protection of digital information. ',
              style: TextStyle(fontSize: 17),
            ),
            //@@@@@@@@@@@@@
            SizedBox(height: 20),
            Text(
              'Here Are Some Laws:',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'IPC Section 43 : Unauthorized Access',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Imprisonment for a term that may extend to 2 years or a fine that may extend to ₹5 lakhs, or both.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Section 66 :  Computer-Related Offenses',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Imprisonment for a term that may extend to 3 years or a fine that may extend to ₹5 lakhs, or both.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Information Technology Act, 2000, Section 43: Unauthorized Access to Computer Systems:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'The section provides for a penalty for unauthorized access to computer systems. The person found guilty may be liable to pay damages by way of compensation to the person so affected. The amount of compensation is left to the discretion of the adjudicating officer.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Information Technology Act, 2000, Section 66C: Identity Theft:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Imprisonment for a term that may extend to three years and a fine that may extend to one lakh rupees.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Information Technology Act, 2000, Section 66B: Punishment for Unauthorized Access to Computer Material:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Imprisonment for a term that may extend to three years and shall also be liable to fine which may extend to one lakh rupees.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '**For More Details You Can Check Out Cyber Law Of INDIA**',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900),
            ),

          ],
        ),
      ),
    );
  }
}