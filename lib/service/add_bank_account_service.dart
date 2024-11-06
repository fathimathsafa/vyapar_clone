import 'package:dio/dio.dart';
import 'package:vyapar_clone/model/add_bank_account_model.dart';

class BankDetailsService {
  final Dio _dio = Dio();

  Future<AddBankAccountModel> fetchBankDetail() async {
    try {
      final response =
          await _dio.get('http://vyapar-ot57.onrender.com/api/bank');

      if (response.statusCode == 200) {
        return AddBankAccountModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load bank detail');
      }
    } catch (e) {
      throw Exception('Error fetching bank detail: $e');
    }
  }
}
