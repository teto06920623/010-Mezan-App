// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class InstallmentsScreen extends StatefulWidget {
  const InstallmentsScreen({super.key});

  @override
  State<InstallmentsScreen> createState() => _InstallmentsScreenState();
}

class _InstallmentsScreenState extends State<InstallmentsScreen> {
  
  List<Map<String, String>> installments = [];

  
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  
  void _showAddDialog({int? index}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFEF1E0),
          title: Text(
            index == null
                ? "إضافة قسط جديد"
                : "تعديل القسط", 
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
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "القسط الشهري",
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: "الميعاد (مثال: 9/8)",
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _notesController,
                  decoration: InputDecoration(
                    labelText: "ملاحظات",
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: Text("إلغاء", style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB1BE94),
              ),
              onPressed: () {
                
                if (_amountController.text.isNotEmpty &&
                    _dateController.text.isNotEmpty) {
                  setState(() {
                    if (index == null) {
                      
                      installments.add({
                        "amount": _amountController.text,
                        "date": _dateController.text,
                        "notes": _notesController.text.isEmpty
                            ? "-"
                            : _notesController.text,
                      });
                    } else {
                      
                      installments[index] = {
                        "amount": _amountController.text,
                        "date": _dateController.text,
                        "notes": _notesController.text.isEmpty
                            ? "-"
                            : _notesController.text,
                      };
                    }
                  });
                  
                  _amountController.clear();
                  _dateController.clear();
                  _notesController.clear();
                  Navigator.pop(context); 
                }
              },
              child: Text(
                index == null ? "إضافة" : "حفظ التعديل", 
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
      
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          _amountController.clear();
          _dateController.clear();
          _notesController.clear();
          _showAddDialog(); 
        },
        backgroundColor: Color(0xFF4A5D4E),
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
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
                      "في هذه الغرفه يتم عرض او اضافة او حذف الاقساط الملتزم بها حاليا",
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
            SizedBox(height: 30),
            Expanded(
              
              child: installments.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ليس لديك اي قسط بعد",
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'ReemKufi',
                            color: Color(0xFF8B9D77),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/no quest.gif',
                            width: 350,
                          ), 
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Table(
                        border: TableBorder.all(
                          color: Colors.green.shade800,
                          width: 1.5,
                        ),
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(1),
                          3: FlexColumnWidth(
                            0.7,
                          ), 
                        },
                        children: [
                          TableRow(
                            decoration: BoxDecoration(color: Color(0xFFFEF1E0)),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "ملاحظات",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "الميعاد",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "القسط الشهري",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "تعديل/حذف",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          ...installments.asMap().entries.map((entry) {
                            final installment = entry.value;
                            final index = entry.key;
                            return TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    installment["notes"]!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    installment["date"]!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    installment["amount"]!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      
                                      InkWell(
                                        onTap: () {
                                          
                                          _amountController.text =
                                              installment["amount"]!;
                                          _dateController.text =
                                              installment["date"]!;
                                          _notesController.text =
                                              installment["notes"] == "-"
                                              ? ""
                                              : installment["notes"]!;
                                          
                                          _showAddDialog(index: index);
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                      ),
                                      
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            installments.removeAt(index);
                                          });
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
