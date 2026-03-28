// ignore_for_file: avoid_unnecessary_containers, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:mizanappmaterial/MizanApp_Log.dart';

class MizanappHome extends StatefulWidget {
  final String userName;
  const MizanappHome({super.key, required this.userName});
  @override
  State<MizanappHome> createState() => _MizanappHomeState();
}

class _MizanappHomeState extends State<MizanappHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1E0),

      appBar: AppBar(
        backgroundColor: Color(0xFFFEF1E0),
        scrolledUnderElevation: 0,
        title: Center(
          child: Text(
            "ميزان",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'ReemKufi',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    margin: const EdgeInsets.only(right: 40, top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFB1BE94),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " مرحبًا بك في ميزان! يا بشمهندس${widget.userName}.",
                        style: TextStyle(fontSize: 18, fontFamily: 'ReadexPro'),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: -35,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/logo (2).png',
                        height: 60,
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF55A45E),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "حساب تحويل العملات بالدولار",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lemonada',
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Image(
                            image: AssetImage('assets/images/dolar.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF55A45E),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "حساب تحويل العملات باليورو",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lemonada',
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        CircleAvatar(
                          radius: 40,
                          child: Image(
                            image: AssetImage('assets/images/aqsat.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
