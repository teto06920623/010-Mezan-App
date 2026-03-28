// ignore_for_file: avoid_print, unused_field, deprecated_member_use, camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:mizanappmaterial/MizanApp_Home.dart';

class MizanApp_Login extends StatefulWidget {
  const MizanApp_Login({super.key});

  @override
  State<MizanApp_Login> createState() => _MizanApp_LoginState();
}

class _MizanApp_LoginState extends State<MizanApp_Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  String? selectedCountry;
  bool _isCountryMenuOpen = false;
  bool _isSalaryHidden = true;
  bool _isBalanceHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
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
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
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
                  controller: userNameController,
                  decoration: InputDecoration(
                    labelText: "اسم المستخدم",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'برجاء إدخال البيانات المطلوبة';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),
                // الايميل
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "الايميل",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'برجاء إدخال البيانات المطلوبة';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),
                //الراتب الشهري
                TextFormField(
                  obscureText: _isSalaryHidden,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "الراتب الشهري",
                    border: OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _isSalaryHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _isSalaryHidden ? Colors.grey : Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          _isSalaryHidden = !_isSalaryHidden;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'برجاء إدخال البيانات المطلوبة';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),
                //الرصيد البنكي
                TextFormField(
                  obscureText: _isBalanceHidden,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "الرصيد البنكي",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isBalanceHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _isBalanceHidden ? Colors.grey : Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          _isBalanceHidden = !_isBalanceHidden;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'برجاء إدخال البيانات المطلوبة';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                InkWell(
                  onTap: () {
                    setState(() {
                      _isCountryMenuOpen = true;
                    });

                    showDialog(
                      context: context,
                      builder: (context) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              width: 150,
                              margin: const EdgeInsets.only(
                                left: 10,
                                bottom: 80,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFB0BFA5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListView(
                                shrinkWrap: true,
                                children:
                                    [
                                      "مصر",
                                      "السعودية",
                                      "الامارات",
                                      "البحرين",
                                      "الكويت",
                                      "قطر",
                                      "عمان",
                                      "اليمن",
                                      "العراق",
                                      "الأردن",
                                      "سوريا",
                                      "لبنان",
                                      "فلسطين",
                                      "السودان",
                                      "ليبيا",
                                      "تونس",
                                      "الجزائر",
                                      "المغرب",
                                    ].map((country) {
                                      return ListTile(
                                        title: Text(
                                          country,
                                          textAlign: TextAlign.right,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedCountry = country;
                                          });
                                          Navigator.pop(context);
                                        },
                                      );
                                    }).toList(),
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((_) {
                      // 2. السهم يرجع يبص لتحت لما القايمة تقفل بأي شكل
                      setState(() {
                        _isCountryMenuOpen = false;
                      });
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedCountry ?? "أختر بلدك",
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Icon(
                          _isCountryMenuOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MizanappHome(userName: userNameController.text),
                        ),
                      );
                    } else {
                      print("فشل تسجيل الدخول، يرجى ملء جميع الحقول");
                    }
                  },
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
        ),
      ),
    );
  }
}
