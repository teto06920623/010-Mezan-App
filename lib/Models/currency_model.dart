class CurrencyModel {
  final String baseCurrency;
  final Map<String, dynamic> rates;

  // Constructor
  CurrencyModel({required this.baseCurrency, required this.rates});

  // دالة الترجمة: بتاخد الـ JSON وتصبّه جوه القالب بتاعنا
  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      baseCurrency: json['base_code'] ?? 'USD', 
      rates: json['rates'] ?? {}, // دي الـ Map اللي فيها كل العملات بأسعارها
    );
  }
}