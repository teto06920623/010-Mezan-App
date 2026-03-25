// ignore_for_file: deprecated_member_use, camel_case_types, file_names
import 'package:flutter/material.dart';

class MizanApp_Login extends StatefulWidget {
  const MizanApp_Login({super.key});

  @override
  State<MizanApp_Login> createState() => _MizanApp_LoginState();
}

class _MizanApp_LoginState extends State<MizanApp_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
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

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 200,
                child: Image.asset("assets/images/login.gif"),
              ),
            ),
            // اسم المستخدم
            TextFormField(
              decoration: InputDecoration(
                labelText: "اسم المستخدم",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),
            // الايميل
            TextFormField(
              decoration: InputDecoration(
                labelText: "الايميل",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),
            //الراتب الشهري
            TextFormField(
              decoration: InputDecoration(
                labelText: "الراتب الشهري",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),
            //الرصيد البنكي
            TextFormField(
              decoration: InputDecoration(
                labelText: "الرصيد البنكي",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),
            //اختيار الدوله
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "الدولة",
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: "السعودية", child: Text("السعودية")),
                DropdownMenuItem(value: "مصر", child: Text("مصر")),
                DropdownMenuItem(value: "الامارات", child: Text("الامارات")),
              ],
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            // زر التسجيل
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                "تسجيل",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ReadexPro',
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
