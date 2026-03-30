// ignore_for_file: avoid_print

import 'package:dio/dio.dart'; // استدعاء مكتبة Dio
import 'currency_model.dart'; // استدعاء الموديل بتاعنا عشان نصب فيه الداتا

class ApiService {
  final Dio _dio = Dio();

  Future<CurrencyModel?> fetchExchangeRates() async {
    try {
      Response response = await _dio.get('https://open.er-api.com/v6/latest/USD');
      
      if (response.statusCode == 200) {
        return CurrencyModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
    return null; 
  }
}