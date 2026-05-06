// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String userName;
  final String email;
  final String salary;
  final String balance;
  final String country;

  const ProfileScreen({
    super.key,
    required this.userName,
    required this.email,
    required this.salary,
    required this.balance,
    required this.country,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  late String currentUserName;
  late String currentEmail;
  late String currentSalary;
  late String currentBalance;
  late String currentCountry;

  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _balanceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    currentUserName = widget.userName;
    currentEmail = widget.email;
    currentSalary = widget.salary;
    currentBalance = widget.balance;
    currentCountry = widget.country;
  }

  
  void _showEditDialog() {
    
    _nameController.text = currentUserName;
    _emailController.text = currentEmail;
    _salaryController.text = currentSalary;
    _balanceController.text = currentBalance;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFEF1E0),
          title: Text(
            "تعديل البيانات",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: 'ReemKufi',
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "الاسم",
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "الإيميل",
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "الراتب الشهري",
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _balanceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "الحساب البنكي",
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("إلغاء", style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB1BE94),
              ),
              onPressed: () {
                
                setState(() {
                  currentUserName = _nameController.text;
                  currentEmail = _emailController.text;
                  currentSalary = _salaryController.text;
                  currentBalance = _balanceController.text;
                });
                Navigator.pop(context);
              },
              child: Text(
                "حفظ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFEF1E0),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF7A9176),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "تسجيل خروج",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ReemKufi',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "ميزان",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ReemKufi',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 60),
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          top: 80,
                          bottom: 30,
                          left: 20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFB1BE94),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Text(
                              currentUserName,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ReadexPro',
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              currentEmail,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ReadexPro',
                              ),
                            ),
                            SizedBox(height: 25),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF7A9176),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                currentCountry,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ReemKufi',
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 110,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          currentBalance,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "الحساب البنكي",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'ReemKufi',
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 110,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          currentSalary,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "الراتب الشهري",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'ReemKufi',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed:
                                  _showEditDialog, 
                              child: Text(
                                "تعديل",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ReemKufi',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFF7A9176),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 70,
                              color: Colors.grey.shade400,
                            ),
                          ),
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
    );
  }
}
