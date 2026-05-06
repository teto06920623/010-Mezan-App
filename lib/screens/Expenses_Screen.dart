// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  final String salary; 

  const ExpensesScreen({super.key, required this.salary});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    
    double userSalary = double.tryParse(widget.salary) ?? 0.0;

    
    double needsValue = userSalary * 0.50;
    double wantsValue = userSalary * 0.30;
    double savingsValue = userSalary * 0.20;

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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(right: 40, top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFB1BE94),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "في هذه الصفحه يتم عرض أفضل نسبه لتنظيم المصروفات من خلال مرتبك",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'ReemKufi',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: -20,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/logo (2).png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Container(
                width: 250,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xFF7A9176),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "${userSalary.toInt()}",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    _buildCategoryCard(
                      title: "الأساسيات\nوالفواتير الثابتة",
                      percentage: 0.50,
                      value: needsValue,
                      items: ["الإيجار/السكن", "المرافق والكهرباء", "الطعام والبقالة", "المواصلات"],
                    ),
                    SizedBox(width: 10),

                    
                    _buildCategoryCard(
                      title: "المصروفات\nالشخصيه المتغيره",
                      percentage: 0.30,
                      value: wantsValue,
                      items: ["التسوق", "الانشطه الترفيهيه", "الرحلات", "الهدايا"],
                    ),
                    SizedBox(width: 10),

                    
                    _buildCategoryCard(
                      title: "الادخارات\nوالاستثمارات",
                      percentage: 0.20,
                      value: savingsValue,
                      items: ["زيادة المدخرات", "تعجيل سداد الديون", "حالات الطوارئ", "استثمارات"],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({required String title, required double percentage, required double value, required List<String> items}) {
    return Container(
      width: 180, 
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'ReemKufi',
            ),
          ),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${(percentage * 100).toInt()}%", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("${value.toStringAsFixed(1)}", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          ...items.map((item) => _buildListItem(item)).toList(),
        ],
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'ReemKufi',
              ),
            ),
          ),
          SizedBox(width: 5),
          Icon(Icons.label_important, size: 16, color: Colors.grey.shade700),
        ],
      ),
    );
  }
}