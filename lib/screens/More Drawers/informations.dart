
import 'package:flutter/material.dart';

import 'information/Cyber_Laws.dart';
import 'information/Malware.dart';
import 'information/Protocols.dart';




class InfoPage extends StatelessWidget {

  List catNames = [
    'Malware',
    'Protocols',
    'Cyber Laws',
  ];

  List<Color> catColors = [
    Color(0xFFEE0B0B),
    const Color(0xFF88EE0B),
    Color(0xFF5B85F5),
  ];

  List<Icon> catIcons = [
    Icon(Icons.coronavirus, color: Colors.white, size: 30,),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Icon(Icons.book_outlined, color: Colors.white, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.greenAccent,
      ),

      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 0.01),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 3,
                    bottom: 15,
                  ),
                  child: Text(
                    "Hi, Ethical Hacker",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 20,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "  Search Here",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15,),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: () {
                        //Navigate using Switch @@@@@@@@@@@@@@@@@@
                        switch (catNames[index]) {
                          case 'Malware':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MalwarePage(),
                              ),
                            );
                            break;
                          case 'Protocols':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProtocolsPage(),
                              ),
                            );
                            break;
                          case 'Cyber Laws':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CyberLawsPage(),
                              ),
                            );
                            break;
                        }
                      },

                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: catIcons[index],),
                          ),
                          SizedBox(height: 10),
                          Text(
                            catNames[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

