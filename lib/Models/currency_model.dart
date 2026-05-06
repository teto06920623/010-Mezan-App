class CurrencyModel {
  final String baseCurrency;
  final Map<String, dynamic> rates;

  CurrencyModel({required this.baseCurrency, required this.rates});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      baseCurrency: json['base_code'] ?? 'USD', 
      rates: json['rates'] ?? {}, 
    );
  }
}