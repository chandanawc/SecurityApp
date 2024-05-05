import 'package:flutter/material.dart';

class ProtocolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protocols'),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            //@@@@@@
            Text(
              'Protocols:',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Protocol typically refers to a set of rules or guidelines that govern the secure communication and data exchange between systems, devices, or entities. These protocols play a crucial role in ensuring the confidentiality, integrity, and availability of information in a networked environment.',
              style: TextStyle(fontSize: 17),
            ),
            //@@@@@@@@@@@@@
            SizedBox(height: 20),
            Text(
              'Types of Protocols:',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'HTTP/HTTPS (Hypertext Transfer Protocol/Secure):',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'HTTP is used for transferring hypertext documents on the web. It operates over a connectionless and stateless format. HTTPS is a secure version of HTTP that uses SSL/TLS protocols to encrypt data exchanged between the web server and the client.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'TCP/IP (Transmission Control Protocol/Internet Protocol):',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'TCP ensures reliable, connection-oriented communication between devices by establishing a connection before data exchange and guaranteeing data delivery. IP assigns unique addresses to devices and handles the routing of data packets across networks.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'FTP (File Transfer Protocol):',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'It used for transferring files between computers on a network. It provides a standard set of rules for accessing and managing files on remote systems.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'ICMP (Internet Control Message Protocol):',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Responsible for sending error messages and operational information about network conditions. ICMP is commonly used for diagnostic and error reporting purposes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'BGP (Border Gateway Protocol):',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'A routing protocol used to exchange routing and reachability information among autonomous systems (AS) on the Internet. BGP is crucial for directing traffic between different parts of the internet.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'ARP (Address Resolution Protocol):',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Resolves IP addresses to MAC addresses in a local network. ARP is essential for mapping network layer addresses to link layer addresses.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'TCP (Transmission Control Protocol):',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Ensures reliable, connection-oriented communication by establishing a connection, dividing data into segments, numbering them, and reordering them on the receiving end.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'UDP (User Datagram Protocol):',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'A connectionless and lightweight protocol that doesnt guarantee reliable delivery but is faster for real-time applications such as streaming and online gaming.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'IP (Internet Protocol):',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Assigns unique IP addresses to devices on a network, allowing them to communicate. IP is a fundamental protocol for internet communication.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'SMTP (Simple Mail Transfer Protocol):',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Used for sending emails. SMTP works with other email protocols to ensure the delivery of messages between mail servers.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'POP3/IMAP (Post Office Protocol 3/Internet Message Access Protocol):',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Protocols for retrieving emails from a server. POP3 downloads emails to a device, while IMAP keeps them on the server, allowing multiple devices to access the same mailbox.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'SNMP (Simple Network Management Protocol):',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Used for managing and monitoring network devices and their functions. SNMP allows administrators to gather information and control network devices.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'DNS (Domain Name System):',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Resolves human-readable domain names to IP addresses, facilitating the translation of domain names like www.example.com into the corresponding numerical IP address.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}