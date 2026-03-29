// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ConversionCurrency extends StatefulWidget {
  final String userName;
  const ConversionCurrency({super.key, required this.userName});
  @override
  State<ConversionCurrency> createState() => _ConversionCurrencyState();
}

class _ConversionCurrencyState extends State<ConversionCurrency> {
  String? selectedCountry;
  bool _isCountryMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1E0),

      appBar: AppBar(
        backgroundColor: Color(0xFFFEF1E0),
        scrolledUnderElevation: 0,
        title: Center(
          child: Text(
            "تحويل العملات",
            style: TextStyle(
              fontSize: 30,
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
              SizedBox(
                child: Stack(
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
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "مرحبًا بك في ميزان يا بشمهندس ${widget.userName}，في هذه الصفحة يمكنك تحويل العملات بسهولة والحصول على قيمتها بالدولار أو العملات الأخرى.",
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'ReemKufi',
                          ),
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
              ),
              SizedBox(height: 40),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "اختر العمله المراد تحويلها:👇",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Lateef',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                                width: 190,
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  bottom: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB0BFA5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListView(
                                  shrinkWrap: true,
                                  children:
                                      [
                                        "الدولار الأمريكي (USD)",
                                        "اليورو (EUR)",
                                        "الجنيه الإسترليني (GBP)",
                                        "الين الياباني (JPY)",
                                        "اليوان الصيني (CNY)",
                                        "الدولار الكندي (CAD)",
                                        "الدولار الأسترالي (AUD)",
                                        "الفرنك السويسري (CHF)",
                                        "الريال السعودي (SAR)",
                                        "الدرهم الإماراتي (AED)",
                                        "الدينار الكويتي (KWD)",
                                        "الريال القطري (QAR)",
                                        "الدينار البحريني (BHD)",
                                        "الريال العماني (OMR)",
                                        "الجنيه المصري (EGP)",
                                        "الليرة التركية (TRY)",
                                        "الروبل الروسي (RUB)",
                                        "البيزو المكسيكي (MXN)",
                                        "الروبية الهندية (INR)",
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
                        setState(() {
                          _isCountryMenuOpen = false;
                        });
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedCountry ?? "أختر العمله",
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
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
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        "إلى:  👈",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Lateef',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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
                                width: 190,
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  bottom: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB0BFA5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListView(
                                  shrinkWrap: true,
                                  children:
                                      [
                                        "الدولار الأمريكي (USD)",
                                        "اليورو (EUR)",
                                        "الجنيه الإسترليني (GBP)",
                                        "الين الياباني (JPY)",
                                        "اليوان الصيني (CNY)",
                                        "الدولار الكندي (CAD)",
                                        "الدولار الأسترالي (AUD)",
                                        "الفرنك السويسري (CHF)",
                                        "الريال السعودي (SAR)",
                                        "الدرهم الإماراتي (AED)",
                                        "الدينار الكويتي (KWD)",
                                        "الريال القطري (QAR)",
                                        "الدينار البحريني (BHD)",
                                        "الريال العماني (OMR)",
                                        "الجنيه المصري (EGP)",
                                        "الليرة التركية (TRY)",
                                        "الروبل الروسي (RUB)",
                                        "البيزو المكسيكي (MXN)",
                                        "الروبية الهندية (INR)",
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
                        setState(() {
                          _isCountryMenuOpen = false;
                        });
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedCountry ?? "أختر العمله",
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
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
